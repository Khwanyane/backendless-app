import 'package:flutter/material.dart';

class ProgressMessage extends StatelessWidget {
  const ProgressMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(message)],
        ),
      ),
    );
  }
}
