import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_photo.freezed.dart';

enum MealPhotoSource { camera, gallery, recovery }

enum MealPhotoStatus {
  localOnly,
  queued,
  uploading,
  uploaded,
  failed,
  removing,
  removeFailed,
}

@freezed
abstract class MealPhoto with _$MealPhoto {
  const factory MealPhoto({
    required String ref,
    required String localPath,
    required int width,
    required int height,
  }) = _MealPhoto;
}

@freezed
abstract class MealPhotoAttachment with _$MealPhotoAttachment {
  const factory MealPhotoAttachment({
    MealPhoto? photo,
    @Default(MealPhotoStatus.localOnly) MealPhotoStatus status,
    @Default(false) bool uploadApproved,
  }) = _MealPhotoAttachment;
}

class PhotoMask {
  const PhotoMask(this.left, this.top, this.right, this.bottom);

  final double left;
  final double top;
  final double right;
  final double bottom;
}
