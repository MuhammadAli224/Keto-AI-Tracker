import 'package:flutter/services.dart';

class AndroidWidgetSnapshot {
  const AndroidWidgetSnapshot({
    required this.language,
    required this.timezone,
    required this.expiresAt,
    required this.status,
    this.confirmedKcal,
    this.pendingKcal,
    this.waterMl,
    this.fastEnd,
    this.weightKg,
  });

  final String language;
  final String timezone;
  final DateTime expiresAt;
  final String status;
  final double? confirmedKcal;
  final double? pendingKcal;
  final int? waterMl;
  final DateTime? fastEnd;
  final double? weightKg;

  Map<String, Object> toChannelArgs() => {
    'language': language,
    'timezone': timezone,
    'expiresAt': expiresAt.millisecondsSinceEpoch,
    'status': status,
    if (confirmedKcal case final value?) 'confirmedKcal': value,
    if (pendingKcal case final value?) 'pendingKcal': value,
    if (waterMl case final value?) 'waterMl': value,
    if (fastEnd case final value?) 'fastEnd': value.millisecondsSinceEpoch,
    if (weightKg case final value?) 'weightKg': value,
  };
}

class AndroidWidgetBridge {
  const AndroidWidgetBridge();

  static const _channel = MethodChannel('keto_tracker/home_widget');

  Future<void> publish(AndroidWidgetSnapshot snapshot) =>
      _channel.invokeMethod<void>('publish', snapshot.toChannelArgs());

  Future<void> hide() => _channel.invokeMethod<void>('hide');
}
