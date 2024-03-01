import 'package:asignment_2/routes/routes.dart';
import 'package:asignment_2/views/widgets/logout.dart';
import 'package:flutter/material.dart';

class NavugationDrawer extends StatelessWidget {
  const NavugationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(60.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
              ),
              Text(
                'R A R E  F I N D Z',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'L e t  u s  p l u g  y o u,  g c w a l a.',
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
              const ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Premium'),
              ),
              const ListTile(
                leading: Icon(Icons.group),
                title: Text('Community'),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).pushNamed(RouteManager.wishList);
                }),
                child: const ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorites'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  loggingOut(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
