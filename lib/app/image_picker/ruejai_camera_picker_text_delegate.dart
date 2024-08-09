import 'package:flutter/widgets.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class RuejaiCameraPickerTextDelegate implements CameraPickerTextDelegate {
  factory RuejaiCameraPickerTextDelegate(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  RuejaiCameraPickerTextDelegate._internal();

  static final RuejaiCameraPickerTextDelegate _instance =
      RuejaiCameraPickerTextDelegate._internal();

  final EnglishCameraPickerTextDelegate englishDelegate =
      const EnglishCameraPickerTextDelegate();

  late BuildContext context;

  @override
  String confirm = 'Confirm';

  @override
  String shootingTips = '';

  @override
  String loadFailed = 'Load failed';

  @override
  String get languageCode => 'en';

  @override
  String get loading => englishDelegate.loading;

  @override
  String get sActionManuallyFocusHint =>
      englishDelegate.sActionManuallyFocusHint;

  @override
  String get sActionPreviewHint => englishDelegate.sActionPreviewHint;

  @override
  String get sActionRecordHint => englishDelegate.sActionRecordHint;

  @override
  String get sActionShootHint => englishDelegate.sActionShootHint;

  @override
  String get sActionShootingButtonTooltip =>
      englishDelegate.sActionShootingButtonTooltip;

  @override
  String get sActionStopRecordingHint =>
      englishDelegate.sActionStopRecordingHint;

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) {
    return englishDelegate.sCameraLensDirectionLabel(value);
  }

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    return englishDelegate.sCameraPreviewLabel(value);
  }

  @override
  String sFlashModeLabel(FlashMode mode) {
    return englishDelegate.sFlashModeLabel(mode);
  }

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) {
    return englishDelegate.sSwitchCameraLensDirectionLabel(value);
  }

  @override
  String get saving => englishDelegate.saving;

  @override
  String get shootingOnlyRecordingTips =>
      englishDelegate.shootingOnlyRecordingTips;

  @override
  String get shootingTapRecordingTips =>
      englishDelegate.shootingTapRecordingTips;

  @override
  String get shootingWithRecordingTips =>
      englishDelegate.shootingWithRecordingTips;
}
