import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/budget/budget_cubit.dart';

class OwnerExportPage extends StatelessWidget {
  const OwnerExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExportCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.budget_export))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppText(context.tr(LocaleKeys.budget_exportHelp)),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: cubit.busy
                  ? null
                  : () async {
                      final approved = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: AppText(context.tr(LocaleKeys.budget_export)),
                          content: AppText(
                            context.tr(LocaleKeys.budget_exportConsent),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: AppText(
                                context.tr(LocaleKeys.common_cancel),
                              ),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: AppText(
                                context.tr(LocaleKeys.common_continueAction),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (context.mounted && approved == true) {
                        await cubit.save(consent: true);
                      }
                    },
              child: AppText(context.tr(LocaleKeys.budget_createJson)),
            ),
            if (cubit.busy) const LinearProgressIndicator(),
            if (cubit.state == ExportStatus.saved)
              AppText(context.tr(LocaleKeys.budget_exportSaved)),
            if (cubit.state == ExportStatus.failed)
              AppText(context.tr(LocaleKeys.budget_exportFailed)),
          ],
        ),
      ),
    );
  }
}
