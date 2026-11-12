import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/home_widget/home_widget_cubit.dart';

class HomeWidgetPage extends StatelessWidget {
  const HomeWidgetPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.homeWidget_title))),
    body: SafeArea(
      child: BlocBuilder<HomeWidgetCubit, HomeWidgetState>(
        builder: (context, state) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppText(context.tr(LocaleKeys.homeWidget_instruction)),
            SwitchListTile(
              title: AppText(context.tr(LocaleKeys.homeWidget_showValues)),
              subtitle: AppText(context.tr(LocaleKeys.homeWidget_privacy)),
              value: state.visible,
              onChanged: state.busy
                  ? null
                  : context.read<HomeWidgetCubit>().setVisible,
            ),
            if (state.busy) const LinearProgressIndicator(),
            if (state.failed) AppText(context.tr(LocaleKeys.homeWidget_failed)),
          ],
        ),
      ),
    ),
  );
}
