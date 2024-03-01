import 'package:asignment_2/services/user_services.dart';
import 'package:asignment_2/views/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void restorePassowrd(BuildContext context, {required String email}) async {
  if (email.isNotEmpty) {
    String results =
        await context.read<UserServices>().resetUserPassword(email.trim());
    if (results != 'OK') {
      snackBar(context, "email not recognised");
    } else {
      snackBar(context, 'Please check your email');
    }
  } else {
    snackBar(context, 'Please enter your email');
  }
}
