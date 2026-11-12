import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/wellness.dart';

class FastElapsed extends StatefulWidget {
  const FastElapsed({super.key, required this.session});

  final FastSession session;

  @override
  State<FastElapsed> createState() => _FastElapsedState();
}

class _FastElapsedState extends State<FastElapsed> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _schedule();
  }

  @override
  void didUpdateWidget(covariant FastElapsed oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.session.status != widget.session.status) _schedule();
  }

  void _schedule() {
    _timer?.cancel();
    if (widget.session.status == FastStatus.active) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(() {}),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = widget.session.elapsed(DateTime.now());
    final format = NumberFormat('00', context.locale.toString());
    final clock = [
      format.format(duration.inHours),
      format.format(duration.inMinutes.remainder(60)),
      format.format(duration.inSeconds.remainder(60)),
    ].join(':');
    return AppText(
      context.tr(LocaleKeys.wellness_elapsed, args: [clock]),
      fontSize: 20,
    );
  }
}
