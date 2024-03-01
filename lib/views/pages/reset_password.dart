import 'package:asignment_2/views/widgets/button.dart';
import 'package:flutter/material.dart';
import '../widgets/reset_password.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.email,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'E M A I L',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  hintText: 'email',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Button(
                  onTap: () {
                    restorePassowrd(context, email: email.text.trim());
                  },
                  text: "Submit"),
            ],
          ),
        ),
      )),
    );
  }
}
