import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class OwnerExportDataSource {
  const OwnerExportDataSource(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  static const _channel = MethodChannel('keto_tracker/export');
  static const _server = GetOptions(source: Source.server);

  Future<Map<String, Object>> read(String uid) async {
    if (_auth.currentUser?.uid != uid) throw StateError('Owner changed');
    final owner = _firestore.collection('users').doc(uid);
    final queries = Future.wait([
      owner.collection('meals').get(_server),
      owner.collection('water').get(_server),
      owner.collection('weights').get(_server),
    ]);
    final (profile, snapshots) = await (
      owner.get(_server),
      queries,
    ).wait.timeout(const Duration(seconds: 20));
    if (_auth.currentUser?.uid != uid ||
        profile.data()?['confirmedAt'] is! Timestamp ||
        profile.data()?['confirmationVersion'] != 1 ||
        profile.metadata.hasPendingWrites ||
        snapshots.any((snapshot) => snapshot.metadata.hasPendingWrites)) {
      throw StateError('Export requires synced owner data');
    }
    return {
      'goals':
          _select(profile.data()!, [
              'timezone',
              'windowStart',
              'windowEnd',
              'calories',
              'proteinGrams',
              'carbsGrams',
              'fatGrams',
              'waterMl',
              'confirmedAt',
              'updatedAt',
            ])
            ..['weeklyBudgetFils'] =
                ((profile.data()!['weeklyBudgetJod'] as num) * 1000).round(),
      'meals': [
        for (final record in snapshots[0].docs.map((doc) => doc.data()))
          if (record['status'] != 'deleted')
            {
              ..._select(record, [
                'id',
                'dayKey',
                'timezone',
                'eatenAtUtc',
                'type',
                'status',
                'updatedAt',
              ]),
              'servings': [
                for (final serving
                    in (record['servings'] as List)
                        .cast<Map<String, dynamic>>())
                  {
                    ..._select(serving, [
                      'foodId',
                      'name',
                      'edibleGrams',
                      'source',
                      'sourceReference',
                    ]),
                    'nutrients': _select(
                      serving['nutrients'] as Map<String, dynamic>,
                      ['kcal', 'protein', 'carbs', 'fiber', 'fat', 'carbBasis'],
                    ),
                  },
              ],
            },
      ],
      'water': [
        for (final record in snapshots[1].docs.map((doc) => doc.data()))
          if (record['deleted'] != true)
            _select(record, [
              'id',
              'dayKey',
              'timezone',
              'recordedAt',
              'ml',
              'updatedAt',
            ]),
      ],
      'weights': [
        for (final record in snapshots[2].docs.map((doc) => doc.data()))
          if (record['deleted'] != true)
            _select(record, [
              'id',
              'timezone',
              'measuredAt',
              'kg',
              'notes',
              'updatedAt',
            ]),
      ],
    };
  }

  Map<String, Object?> _select(
    Map<String, dynamic> record,
    List<String> fields,
  ) => {
    for (final field in fields)
      if (record.containsKey(field))
        field: switch (record[field]) {
          final Timestamp value => value.toDate().toUtc().toIso8601String(),
          final String value => value,
          final num value when value.isFinite => value,
          _ => null,
        },
  };

  Future<bool> save(Map<String, Object> data) async =>
      await _channel.invokeMethod<bool>(
        'save',
        Uint8List.fromList(
          utf8.encode(const JsonEncoder.withIndent('  ').convert(data)),
        ),
      ) ??
      false;
}
