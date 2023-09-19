import 'package:asignment_2/routes/routes.dart';
import 'package:asignment_2/services/user_services.dart';

import 'package:asignment_2/views/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void loggingOut(BuildContext context) async {
  String results = await context.read<UserServices>().loggingUserOut();
  if (results != 'OK') {
    snackBar(context, results);
  } else {
    context.read<UserServices>().setUserNull();
    Navigator.popAndPushNamed(context, RouteManager.loginPage);
  }
}
