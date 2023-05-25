import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/asset/asset_model.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<Isar> get isar async => await Isar.open(
        [AssetModelSchema],
        directory: (await getApplicationDocumentsDirectory()).path,
      );
}
