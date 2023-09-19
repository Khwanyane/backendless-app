import 'package:asignment_2/views/widgets/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Names and Surname:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Neo Sylvester Khwanyane'),
                leading: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Cellphone numbers:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('071 704 5913'),
                leading: Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Email Address:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('neokhwanyane@gmail.com'),
                leading: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Qualification:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Diploma in Information Technology'),
                leading: Icon(Icons.school),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  loggingOut(context);
                },
                child: const Text(
                  'Logout',
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
