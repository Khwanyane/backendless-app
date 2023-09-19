import 'package:asignment_2/routes/routes.dart';
import 'package:asignment_2/services/user_services.dart';
import 'package:asignment_2/views/widgets/snackbar.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void userRegistration(BuildContext context,
    {required String email,
    required String name,
    required String password}) async {
  if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
    BackendlessUser user = BackendlessUser()
      ..email = email.trim()
      ..password = password.trim()
      ..putProperties({'name': name.trim()});
    String results = await context.read<UserServices>().registerNewUser(user);
    if (results == 'OK') {
      snackBar(context, 'Registration successful');
      Navigator.of(context).pushNamed(RouteManager.loginPage);
    } else {
      snackBar(context, results);
    }
  } else {
    snackBar(context, 'Please enter all fields');
  }
}
