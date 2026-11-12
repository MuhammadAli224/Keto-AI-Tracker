import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/wellness.dart';
import '../../domain/repository/wellness_repository.dart';

String wellnessSyncKey(WellnessSync sync) => switch (sync) {
  WellnessSync.cached => LocaleKeys.wellness_cached,
  WellnessSync.pending => LocaleKeys.wellness_pending,
  WellnessSync.synced => LocaleKeys.wellness_synced,
};

String wellnessErrorKey(WellnessError error) => switch (error) {
  WellnessError.denied => LocaleKeys.common_forbidden,
  WellnessError.invalid => LocaleKeys.common_notValidNumberHint,
  WellnessError.connection => LocaleKeys.common_checkInternet,
  WellnessError.unexpected => LocaleKeys.common_unknownError,
};
