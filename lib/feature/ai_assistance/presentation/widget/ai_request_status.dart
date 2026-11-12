import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/ai_assistance.dart';
import '../cubit/ai_assistance/ai_assistance_cubit.dart';

class AiRequestStatus extends StatelessWidget {
  const AiRequestStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiAssistanceCubit>();
    if (cubit.state.busy) {
      return Column(
        children: [
          const LinearProgressIndicator(),
          TextButton(
            onPressed: cubit.clear,
            child: AppText(context.tr(LocaleKeys.common_cancel)),
          ),
        ],
      );
    }
    final failure = cubit.state.failure;
    if (failure == null) return const SizedBox.shrink();
    return AppText(
      context.tr(switch (failure) {
        AiFailure.unavailable => LocaleKeys.ai_unavailable,
        AiFailure.limited => LocaleKeys.ai_limitReached,
        AiFailure.connection => LocaleKeys.ai_connection,
      }),
    );
  }
}
