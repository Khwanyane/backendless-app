import 'package:asignment_2/views/widgets/button.dart';
import 'package:asignment_2/views/widgets/registering_a_user.dart';

import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    email = TextEditingController();
    name = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    name.dispose();
    password.dispose();
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
                  Icons.person,
                  size: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'R E G I S T E R',
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
                  height: 20,
                ),
                TextField(
                  autofocus: true,
                  controller: name,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'first name',
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
                  height: 20,
                ),
                TextField(
                  autofocus: true,
                  controller: password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
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
                  height: 20,
                ),

                Button(
                    onTap: () {
                      userRegistration(context,
                          email: email.text.trim(),
                          name: name.text.trim(),
                          password: password.text.trim());
                    },
                    text: "Register"),

                // ),
                const SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already registered? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteManager.loginPage);
                      },
                      child: const Text(
                        'Login here',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
