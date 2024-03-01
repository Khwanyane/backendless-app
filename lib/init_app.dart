import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asignment_2/services/user_services.dart';
import '../../routes/routes.dart';

class InitializingApp {
  static const String appID = '952992C7-CEBC-D21B-FF0E-7526A030C200';
  static const String androidApiKey = 'EE32ED64-1AE2-45C1-B001-E2ADAFC62E8F';
  static const String iosApiKey = '7BF49A41-03B4-4716-A75E-5C8972E48AAF';
  static const String jsKey = 'BAB0DDAA-1514-476D-AA9A-54D8B614A4C2';

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
