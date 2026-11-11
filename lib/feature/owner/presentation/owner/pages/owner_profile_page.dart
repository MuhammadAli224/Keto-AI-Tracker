import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../cubit/owner_auth_cubit.dart';
import '../cubit/owner_profile_cubit.dart';
import '../widget/owner_error_text.dart';
import '../widget/owner_profile_form.dart';

class OwnerProfilePage extends StatelessWidget {
  const OwnerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<OwnerAuthCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: AppText(context.tr(LocaleKeys.profile_title)),
        actions: [
          IconButton(
            tooltip: context.tr(LocaleKeys.auth_logout),
            onPressed: auth is AuthWorking
                ? null
                : context.read<OwnerAuthCubit>().signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (auth is AuthFailure)
              AppText(context.tr(ownerErrorKey(auth.error))),
            Expanded(
              child: BlocBuilder<OwnerProfileCubit, OwnerProfileState>(
                builder: (context, state) => switch (state) {
                  ProfileLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  ProfileFailure(:final error) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(context.tr(ownerErrorKey(error))),
                        TextButton(
                          onPressed: context
                              .read<OwnerProfileCubit>()
                              .subscribe,
                          child: AppText(context.tr(LocaleKeys.common_retry)),
                        ),
                      ],
                    ),
                  ),
                  ProfileReady() => OwnerProfileForm(
                    profile: state.snapshot.profile,
                    sync: state.snapshot.sync,
                    saving: state.saving,
                    errorKey: state.saveError == null
                        ? null
                        : ownerErrorKey(state.saveError!),
                    onSave: context.read<OwnerProfileCubit>().save,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
