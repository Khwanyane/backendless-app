import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.grey,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
