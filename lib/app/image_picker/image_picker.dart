import 'package:flutter/material.dart';
import 'package:poc_chat_2/app/image_picker/image_picker_text_delegate.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImagePicker {
  static Future<List<AssetEntity>?> show(
    BuildContext context, {
    required int maxAssets,
    required List<AssetEntity> selectedAssets,
    Function(BuildContext context)? onPressedCameraPicker,
  }) async {
    return AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: maxAssets,
        gridCount: 3,
        pageSize: 120,
        selectedAssets: selectedAssets,
        textDelegate: ImagePickerTextDelegate(context),
        specialPickerType: SpecialPickerType.wechatMoment,
        specialItemPosition: onPressedCameraPicker != null
            ? SpecialItemPosition.prepend
            : SpecialItemPosition.none,
        specialItemBuilder: (onPressedCameraPicker != null)
            ? (context, path, length) {
                return GestureDetector(
                  onTap: () => onPressedCameraPicker.call(context),
                  child: const Row(
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FittedBox(
                            child: Icon(
                              Icons.photo_camera_outlined,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                );
              }
            : null,
      ),
    );
  }
}
