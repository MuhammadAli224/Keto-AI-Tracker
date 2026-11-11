import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/routes.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../cubit/owner_auth_cubit.dart';
import '../widget/owner_error_text.dart';

class OwnerLoginPage extends StatefulWidget {
  const OwnerLoginPage({super.key, this.unavailable = false});

  final bool unavailable;

  @override
  State<OwnerLoginPage> createState() => _OwnerLoginPageState();
}

class _OwnerLoginPageState extends State<OwnerLoginPage> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.auth_login))),
      body: SafeArea(
        child: BlocBuilder<OwnerAuthCubit, OwnerAuthState>(
          builder: (context, state) {
            final busy = state is AuthWorking;
            final disabled =
                widget.unavailable ||
                (state is AuthFailure &&
                    ownerErrorKey(state.error) ==
                        LocaleKeys.auth_providerDisabled);
            void submit() {
              if (!busy && !disabled && _form.currentState!.validate()) {
                context.read<OwnerAuthCubit>().signIn(
                  _email.text,
                  _password.text,
                );
              }
            }

            return Form(
              key: _form,
              child: AutofillGroup(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    TextFormField(
                      controller: _email,
                      enabled: !busy && !disabled,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                      decoration: InputDecoration(
                        labelText: context.tr(LocaleKeys.auth_email),
                      ),
                      validator: (value) => (value ?? '').trim().contains('@')
                          ? null
                          : context.tr(LocaleKeys.common_notValidEmailHint),
                    ),
                    TextFormField(
                      controller: _password,
                      enabled: !busy && !disabled,
                      obscureText: true,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: context.tr(LocaleKeys.auth_password),
                      ),
                      validator: (value) => (value ?? '').isEmpty
                          ? context.tr(LocaleKeys.auth_emptyPasswordHint)
                          : null,
                      onFieldSubmitted: (_) => submit(),
                    ),
                    const SizedBox(height: 20),
                    if (busy) const LinearProgressIndicator(),
                    if (disabled)
                      AppText(context.tr(LocaleKeys.auth_providerDisabled))
                    else if (state is AuthFailure)
                      AppText(context.tr(ownerErrorKey(state.error))),
                    FilledButton(
                      onPressed: busy || disabled ? null : submit,
                      child: AppText(context.tr(LocaleKeys.auth_login)),
                    ),
                    if (kDebugMode)
                      TextButton(
                        onPressed: () => context.push(AppRoutes.profilePreview),
                        child: AppText(context.tr(LocaleKeys.profile_preview)),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
