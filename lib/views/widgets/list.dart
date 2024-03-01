import 'package:flutter/material.dart';

class List extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const List(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
