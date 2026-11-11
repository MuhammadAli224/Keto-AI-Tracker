import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/time/owner_calendar.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../domain/entities/progress.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({
    super.key,
    required this.entries,
    required this.calendar,
    required this.baseline,
    required this.weekly,
  });

  final List<WeightEntry> entries;
  final OwnerCalendar calendar;
  final double baseline;
  final bool weekly;

  @override
  Widget build(BuildContext context) {
    final today = calendar.date(DateTime.now());
    final stepDays = weekly ? 7 : 1;
    final buckets = weekly ? 8 : 14;
    final first = today.subtract(Duration(days: stepDays * buckets - 1));
    final byBucket = <int, double>{};
    for (final entry in entries.reversed) {
      final offset = calendar.date(entry.measuredAt).difference(first).inDays;
      if (offset >= 0 && offset < stepDays * buckets) {
        byBucket[offset ~/ stepDays] = entry.kg;
      }
    }
    final points = byBucket.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    if (points.isEmpty) {
      return AppText(context.tr(LocaleKeys.progress_noChartData));
    }
    final colors = Theme.of(context).colorScheme;
    final values = [baseline, ...points.map((entry) => entry.value)];
    final minimum = values.reduce(math.min);
    final maximum = values.reduce(math.max);
    final number = NumberFormat('0.0', context.locale.toString());
    final date = DateFormat.MMMd(context.locale.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          context.tr(
            LocaleKeys.progress_baseline,
            args: [number.format(baseline)],
          ),
        ),
        Semantics(
          image: true,
          label: context.tr(
            LocaleKeys.progress_chartDescription,
            args: ['${points.length}'],
          ),
          child: SizedBox(
            height: 145,
            child: CustomPaint(
              painter: _WeightPainter(
                points: points,
                buckets: buckets,
                baseline: baseline,
                minimum: minimum,
                maximum: maximum,
                primary: colors.primary,
                outline: colors.outline,
                rtl: Directionality.of(context) == ui.TextDirection.rtl,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [AppText(date.format(first)), AppText(date.format(today))],
        ),
      ],
    );
  }
}

class _WeightPainter extends CustomPainter {
  const _WeightPainter({
    required this.points,
    required this.buckets,
    required this.baseline,
    required this.minimum,
    required this.maximum,
    required this.primary,
    required this.rtl,
    required this.outline,
  });

  final List<MapEntry<int, double>> points;
  final int buckets;
  final double baseline;
  final double minimum;
  final double maximum;
  final Color primary;
  final Color outline;
  final bool rtl;

  @override
  void paint(Canvas canvas, Size size) {
    final width = math.max(0.0, size.width - 16);
    final height = math.max(0.0, size.height - 16);
    final span = math.max(2.0, maximum - minimum);
    final center = (maximum + minimum) / 2;
    double y(double value) => 8 + height * ((center + span / 2 - value) / span);
    final baselinePaint = Paint()
      ..color = outline
      ..strokeWidth = 1;
    for (var x = 8.0; x < size.width - 8; x += 10) {
      canvas.drawLine(
        Offset(x, y(baseline)),
        Offset(math.min(x + 5, size.width - 8), y(baseline)),
        baselinePaint,
      );
    }
    final line = Paint()
      ..color = primary
      ..strokeWidth = 2;
    Offset? previous;
    int? previousIndex;
    for (final point in points) {
      final x = 8 + width * point.key / (buckets - 1);
      final dot = Offset(rtl ? size.width - x : x, y(point.value));
      if (previous != null && previousIndex == point.key - 1) {
        canvas.drawLine(previous, dot, line);
      }
      canvas.drawCircle(dot, 4, line);
      previous = dot;
      previousIndex = point.key;
    }
  }

  @override
  bool shouldRepaint(covariant _WeightPainter oldDelegate) => true;
}
