import '../../../../../generated/app_strings.g.dart';
import '../../../domain/repository/owner_repository.dart';

String ownerErrorKey(OwnerError error) => switch (error) {
  OwnerError.disabled => LocaleKeys.auth_providerDisabled,
  OwnerError.offline => LocaleKeys.common_checkInternet,
  OwnerError.invalidCredentials => LocaleKeys.auth_loginFailed,
  OwnerError.denied => LocaleKeys.common_forbidden,
  OwnerError.unknown => LocaleKeys.common_unknownError,
};
