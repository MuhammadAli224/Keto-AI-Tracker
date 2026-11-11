import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../domain/entities/owner_profile.dart';
import '../widget/owner_profile_form.dart';

class ProfilePreviewPage extends StatelessWidget {
  const ProfilePreviewPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.profile_preview))),
    body: const SafeArea(
      child: OwnerProfileForm(
        profile: null,
        sync: ProfileSync.cached,
        saving: false,
        errorKey: null,
        onSave: null,
        preview: true,
      ),
    ),
  );
}
