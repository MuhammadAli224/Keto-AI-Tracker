import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/wellness/wellness_cubit.dart';
import '../widget/fast_panel.dart';
import '../widget/water_panel.dart';
import '../widget/wellness_text.dart';

class WellnessPage extends StatelessWidget {
  const WellnessPage({
    super.key,
    required this.waterGoal,
    required this.windowStart,
    required this.windowEnd,
  });

  final int waterGoal;
  final String windowStart;
  final String windowEnd;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.wellness_title))),
    body: SafeArea(
      child: BlocBuilder<WellnessCubit, WellnessState>(
        builder: (context, state) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (state.writeError case final error?)
              AppText(context.tr(wellnessErrorKey(error))),
            AppText(
              context.tr(LocaleKeys.wellness_water),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            WaterPanel(state: state, goal: waterGoal),
            const Divider(),
            AppText(
              context.tr(LocaleKeys.wellness_fasting),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            FastPanel(
              state: state,
              windowStart: windowStart,
              windowEnd: windowEnd,
            ),
          ],
        ),
      ),
    ),
  );
}
