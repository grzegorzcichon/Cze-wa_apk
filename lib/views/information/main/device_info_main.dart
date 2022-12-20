import 'package:czestochowa_app/views/information/page/device_info_page.dart';
import 'package:czestochowa_app/views/information/page/ip_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings/strings.dart';
import '../../../widgets/appbars/appbars.dart';
import '../widget/InfoWidget.dart';

class BugInfoPage extends StatefulWidget {
  @override
  _BugInfoPageState createState() => _BugInfoPageState();
}

class _BugInfoPageState extends State<BugInfoPage> {
  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final ipAddress = await IpInfoPage.getIPAdress();
    final phone = await DeviceInfoApi.getPhoneInfo();
    final phoneVersion = await DeviceInfoApi.getPhoneVersion();
    final operatingSystem = await DeviceInfoApi.getOperatingSystem();
    final screenResolution = await DeviceInfoApi.getScreenResolution();
    final brandInfo = await DeviceInfoApi.getBrandInfo();

    if (!mounted) return;

    setState(() => map = {
          Str.label.deviceinfoIP: ipAddress,
          Str.label.devicephone: phone,
          Str.label.deviceosversion: phoneVersion,
          Str.label.deviceosname: operatingSystem,
          Str.label.devicescreenresolution: screenResolution,
          Str.label.devicebrand: brandInfo,
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppbarDeviceInfoScreen(),
        body: InfoWidget(map: map),
      );
}
