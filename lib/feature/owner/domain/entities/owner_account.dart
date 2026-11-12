import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_account.freezed.dart';

@freezed
abstract class OwnerAccount with _$OwnerAccount {
  const factory OwnerAccount({required String uid}) = _OwnerAccount;
}
