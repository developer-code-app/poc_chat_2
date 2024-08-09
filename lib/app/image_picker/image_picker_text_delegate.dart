import 'package:flutter/widgets.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImagePickerTextDelegate implements AssetPickerTextDelegate {
  factory ImagePickerTextDelegate(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  ImagePickerTextDelegate._internal();

  static final ImagePickerTextDelegate _instance =
      ImagePickerTextDelegate._internal();

  final EnglishAssetPickerTextDelegate englishDelegate =
      const EnglishAssetPickerTextDelegate();

  late BuildContext context;

  @override
  String get accessAllTip => 'Access all tip';

  @override
  String get accessLimitedAssets => 'Access limited assets';

  @override
  String get accessiblePathName => 'Accessible path name';

  @override
  String get cancel => 'Cancel';

  @override
  String get changeAccessibleLimitedAssets =>
      'Change accessible limited assets';

  @override
  String get confirm => 'Confirm';

  @override
  String durationIndicatorBuilder(Duration duration) =>
      const AssetPickerTextDelegate().durationIndicatorBuilder(duration);

  @override
  String get edit => 'Edit';

  @override
  String get emptyList => 'Empty list';

  @override
  String get gifIndicator => 'Gif indicator';

  @override
  String get goToSystemSettings => 'Go to system settings';

  @override
  String get loadFailed => 'Load failed';

  @override
  String get original => 'Original';

  @override
  String get preview => 'Preview';

  @override
  String get select => 'Select';

  @override
  String get unSupportedAssetType => 'Unsupported asset type';

  @override
  String get unableToAccessAll => 'Unable to access all';

  @override
  String get viewingLimitedAssetsTip => 'Viewing limited assets tip';

  @override
  String get languageCode => 'en';

  @override
  String get sActionPlayHint => englishDelegate.sActionPlayHint;

  @override
  String get sActionPreviewHint => englishDelegate.sActionPlayHint;

  @override
  String get sActionSelectHint => englishDelegate.sActionSelectHint;

  @override
  String get sActionSwitchPathLabel => englishDelegate.sActionSwitchPathLabel;

  @override
  String get sActionUseCameraHint => englishDelegate.sActionUseCameraHint;

  @override
  String get sNameDurationLabel => englishDelegate.sNameDurationLabel;

  @override
  String get sTypeAudioLabel => englishDelegate.sTypeAudioLabel;

  @override
  String get sTypeImageLabel => englishDelegate.sTypeImageLabel;

  @override
  String get sTypeOtherLabel => englishDelegate.sTypeOtherLabel;

  @override
  String get sTypeVideoLabel => englishDelegate.sTypeVideoLabel;

  @override
  String get sUnitAssetCountLabel => englishDelegate.sUnitAssetCountLabel;

  @override
  String semanticTypeLabel(AssetType type) {
    switch (type) {
      case AssetType.audio:
        return sTypeAudioLabel;
      case AssetType.image:
        return sTypeImageLabel;
      case AssetType.video:
        return sTypeVideoLabel;
      case AssetType.other:
        return sTypeOtherLabel;
    }
  }

  @override
  AssetPickerTextDelegate get semanticsTextDelegate {
    return this;
  }
}
