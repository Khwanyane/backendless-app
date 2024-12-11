import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asignment_2/services/user_services.dart';
import '../../routes/routes.dart';

class InitializingApp {
  static const String appID = '4D67F5DF-AF27-4C3A-ADBA-5A140D3EE747';
  static const String androidApiKey = 'E444857B-DCF6-4E3A-9986-E4309B4A3256';
  static const String iosApiKey = 'AECC6CDF-5D10-49AF-BBC1-94D98B6746BB';
  static const String jsKey = 'D1A9DBB4-74F9-486B-80E0-FF29D35ACE0B';

  static void initializeApp(BuildContext context) async {
    await Backendless.initApp(
      applicationId: appID,
      androidApiKey: androidApiKey,
      iosApiKey: iosApiKey,
      jsApiKey: jsKey,
    );
    String results = await context.read<UserServices>().validLogin();
    if (results != 'OK') {
      Navigator.of(context).popAndPushNamed(RouteManager.loginPage);
    } else {
      Navigator.popAndPushNamed(context, RouteManager.homePage);
    }
  }
}
