import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/ai_assistance/ai_assistance_cubit.dart';
import '../widget/ai_request_status.dart';

class AiCoachPage extends StatefulWidget {
  const AiCoachPage({super.key});

  @override
  State<AiCoachPage> createState() => _AiCoachPageState();
}

class _AiCoachPageState extends State<AiCoachPage> {
  final _message = TextEditingController();
  bool _consent = false;
  bool _includeGoals = false;

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiAssistanceCubit>();
    final state = cubit.state;
    final reply = state.reply;
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.ai_coach))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppText(context.tr(LocaleKeys.ai_coachScope)),
            if (!cubit.available)
              AppText(context.tr(LocaleKeys.ai_unavailable))
            else ...[
              TextField(
                controller: _message,
                enabled: !state.busy,
                maxLength: 1200,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: context.tr(LocaleKeys.ai_question),
                ),
                onChanged: (_) => setState(() => _consent = false),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(context.tr(LocaleKeys.ai_shareGoals)),
                value: _includeGoals,
                onChanged: state.busy
                    ? null
                    : (value) => setState(() {
                        _includeGoals = value ?? false;
                        _consent = false;
                      }),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(context.tr(LocaleKeys.ai_messageConsent)),
                value: _consent,
                onChanged: state.busy
                    ? null
                    : (value) => setState(() => _consent = value ?? false),
              ),
              FilledButton(
                onPressed:
                    !state.busy && _consent && _message.text.trim().isNotEmpty
                    ? () {
                        setState(() => _consent = false);
                        cubit.coach(
                          _message.text,
                          context.locale.languageCode,
                          includeGoals: _includeGoals,
                          consent: true,
                        );
                      }
                    : null,
                child: AppText(context.tr(LocaleKeys.ai_send)),
              ),
              const AiRequestStatus(),
              if (reply != null) ...[
                for (final guidance in reply.guidance)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: AppText(guidance),
                  ),
                for (final question in reply.questions) AppText(question),
                TextButton(
                  onPressed: () => context.push(AppRoutes.profile),
                  child: AppText(context.tr(LocaleKeys.ai_reviewGoals)),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
