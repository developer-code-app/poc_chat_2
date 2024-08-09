import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AssetsPickerCubit extends Cubit<List<AssetEntity>> {
  AssetsPickerCubit() : super([]);

  void addAssets(List<AssetEntity> assets) => emit(assets);

  void remove(AssetEntity asset) {
    final assets = List.of(state);
    assets.remove(asset);
    emit(assets);
  }

  void removeAll() => emit([]);
}
