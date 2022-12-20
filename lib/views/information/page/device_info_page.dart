import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getOperatingSystem() async => Platform.operatingSystem;

  static Future<String> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return '${info.manufacturer} - ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return '${info.name}${info.model}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion.toString();
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getBrandInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.brand.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemName.toString();
    } else {
      throw UnimplementedError();
    }
  }
}
