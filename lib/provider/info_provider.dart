import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoProvider {
  static final InfoProvider _infoProvider = InfoProvider.internal();
  static String deviceName = '';
  static String deviceVersion = '';
  static String deviceId = '';
  static String packageName = '';
  static String appVersion = '0.0.0';

  factory InfoProvider() => _infoProvider;
  InfoProvider.internal() {
    loadPackageInfo();
  }

  Future<void> loadPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    packageName = packageInfo.packageName;
  }

  Future<void> loadDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        deviceId = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        deviceId = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }
}
