import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/app_widget/app_text.dart';
import '../../../generated/app_strings.g.dart';
import '../domain/meal_photo.dart';
import 'meal_photo_cubit.dart';
import 'photo_redaction_dialog.dart';

class MealPhotoPanel extends StatelessWidget {
  const MealPhotoPanel({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MealPhotoCubit, MealPhotoState>(
        builder: (context, state) {
          final cubit = context.read<MealPhotoCubit>();
          final photo = state.photo;
          final disabled = state.busy || !state.ready;
          final status = switch (state.status) {
            MealPhotoStatus.localOnly => LocaleKeys.mealPhoto_localOnly,
            MealPhotoStatus.queued => LocaleKeys.mealPhoto_queued,
            MealPhotoStatus.uploading => LocaleKeys.mealPhoto_uploading,
            MealPhotoStatus.uploaded => LocaleKeys.mealPhoto_uploaded,
            MealPhotoStatus.failed => LocaleKeys.mealPhoto_uploadFailed,
            MealPhotoStatus.removing => LocaleKeys.mealPhoto_removing,
            MealPhotoStatus.removeFailed => LocaleKeys.mealPhoto_removeFailed,
          };
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                context.tr(LocaleKeys.mealPhoto_title),
                fontWeight: FontWeight.bold,
              ),
              if (state.failed) AppText(context.tr(LocaleKeys.mealPhoto_error)),
              if (disabled) const LinearProgressIndicator(),
              if (photo != null) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 240),
                  child: Image.file(
                    File(photo.localPath),
                    fit: BoxFit.contain,
                    semanticLabel: context.tr(LocaleKeys.mealPhoto_title),
                    errorBuilder: (context, _, __) =>
                        AppText(context.tr(LocaleKeys.mealPhoto_error)),
                  ),
                ),
                AppText(context.tr(status)),
                Wrap(
                  spacing: 8,
                  children: [
                    TextButton(
                      onPressed: disabled
                          ? null
                          : () async {
                              final mask = await showDialog<PhotoMask>(
                                context: context,
                                builder: (_) =>
                                    PhotoRedactionDialog(photo: photo),
                              );
                              if (context.mounted && mask != null) {
                                await cubit.redact(mask);
                              }
                            },
                      child: AppText(context.tr(LocaleKeys.mealPhoto_redact)),
                    ),
                    TextButton(
                      onPressed: disabled ? null : cubit.remove,
                      child: AppText(context.tr(LocaleKeys.mealPhoto_remove)),
                    ),
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: AppText(context.tr(LocaleKeys.mealPhoto_upload)),
                  subtitle: AppText(
                    context.tr(
                      cubit.storageAvailable
                          ? LocaleKeys.mealPhoto_uploadConsent
                          : LocaleKeys.mealPhoto_storageUnavailable,
                    ),
                  ),
                  value: state.upload,
                  onChanged: disabled || !cubit.storageAvailable
                      ? null
                      : cubit.setUpload,
                ),
              ] else if (state.status != MealPhotoStatus.localOnly)
                AppText(context.tr(status)),
              if (const {
                MealPhotoStatus.queued,
                MealPhotoStatus.failed,
                MealPhotoStatus.removing,
                MealPhotoStatus.removeFailed,
              }.contains(state.status))
                TextButton(
                  onPressed: disabled ? null : cubit.retry,
                  child: AppText(context.tr(LocaleKeys.common_retry)),
                ),
              Wrap(
                spacing: 8,
                children: [
                  OutlinedButton(
                    onPressed: disabled
                        ? null
                        : () => cubit.capture(MealPhotoSource.camera),
                    child: AppText(context.tr(LocaleKeys.mealPhoto_camera)),
                  ),
                  OutlinedButton(
                    onPressed: disabled
                        ? null
                        : () => cubit.capture(MealPhotoSource.gallery),
                    child: AppText(context.tr(LocaleKeys.mealPhoto_gallery)),
                  ),
                  if (cubit.canRecover)
                    TextButton(
                      onPressed: disabled
                          ? null
                          : () => cubit.capture(MealPhotoSource.recovery),
                      child: AppText(context.tr(LocaleKeys.mealPhoto_recover)),
                    ),
                ],
              ),
            ],
          );
        },
      );
}
