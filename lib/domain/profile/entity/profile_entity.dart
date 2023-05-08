import 'package:freezed_annotation/freezed_annotation.dart';

import '../../assets/entity/asset_entity.dart';

part 'profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String address,
    required double balance,
    required List<AssetEntity> showcase,
  }) = _ProfileEntity;
}
