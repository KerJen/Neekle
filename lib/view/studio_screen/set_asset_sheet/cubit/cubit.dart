import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/assets/entity/asset_entity.dart';
import '../../../../domain/assets/repository/assets_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class SetAssetCubit extends Cubit<SetAssetState> {
  final AssetsRepository assetsRepository;

  SetAssetCubit({
    required this.assetsRepository,
  }) : super(const SetAssetState.initial());

  void setAsset(AssetEntity assetEntity) {}
}
