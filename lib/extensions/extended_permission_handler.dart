import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

extension ExtendedPermission on Permission {
  static Future<PermissionStatus> requestPhotos() async {
    final permission = await photos;
    return permission.request();
  }

  static Future<PermissionStatus> requestVideos() async {
    final permission = await photos;
    return permission.request();
  }

  static Future<Permission> get photos async {
    if (Platform.isIOS) {
      return Permission.photos;
    } else {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final info = await deviceInfoPlugin.androidInfo;

      return info.version.sdkInt >= 33 ? Permission.photos : Permission.storage;
    }
  }

  static Future<Permission> get videos async {
    if (Platform.isIOS) {
      return Permission.photos;
    } else {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final info = await deviceInfoPlugin.androidInfo;

      return info.version.sdkInt >= 33 ? Permission.videos : Permission.storage;
    }
  }
}
