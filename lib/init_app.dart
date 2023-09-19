import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asignment_2/services/user_services.dart';
import '../../routes/routes.dart';

class InitializingApp {
  static const String appID = '99373697-E2AA-1855-FFBF-0B7ED30A3600';
  static const String androidApiKey = '8A57CA23-14F6-4886-9CB0-9C50DC38CE9F';
  static const String iosApiKey = '108D56A0-81D5-4001-B172-B5FF8E3C02C5';
  static const String jsKey = '67350001-7290-407C-82F4-9C6CA09A9DA7';

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
