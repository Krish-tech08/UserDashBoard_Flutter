import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // ✅ White card background
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 11),
      child: ListTile(
        title: Text(
          user.name,
          style: TextStyle(color: Colors.black), // ✅ Black title
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(color: Colors.black87), // ✅ Slightly dimmed black subtitle
        ),
      ),
    );
  }
}
