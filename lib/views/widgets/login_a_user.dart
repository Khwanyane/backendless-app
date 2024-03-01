import 'package:asignment_2/routes/routes.dart';
import 'package:asignment_2/services/user_services.dart';
import 'package:asignment_2/views/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void loginAUser(BuildContext context,
    {required String email, required String password}) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    String results = await context
        .read<UserServices>()
        .userLogin(email.trim(), password.trim());
    if (results == 'OK') {
      Navigator.of(context).popAndPushNamed(RouteManager.homePage);
    } else {
      snackBar(context, "Incorrect details, please try again");
    }
  } else {
    snackBar(context, 'Please enter all fields');
  }
}
