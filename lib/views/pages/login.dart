import 'package:asignment_2/services/user_services.dart';
import 'package:asignment_2/views/widgets/login_a_user.dart';
import 'package:asignment_2/views/widgets/progress_message.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/routes.dart';
import 'package:tuple/tuple.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                    hintText: 'Please enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Please enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)))),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  loginAUser(context,
                      email: email.text.trim(), password: password.text.trim());
                },
                child: const Text('Login')),
            const SizedBox(
              height: 9,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.resetPassword);
              },
              child: const Text('Forgot Password ?'),
            ),
            const SizedBox(
              height: 9,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.registerPage);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
