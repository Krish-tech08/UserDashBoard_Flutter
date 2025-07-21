import 'package:flutter/material.dart';
import '../models/user_model.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', department = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (val) => name = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (val) => email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Department'),
                onChanged: (val) => department = val,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (name.isNotEmpty && email.isNotEmpty) {
                    final newUser = UserModel(name: name, email: email);
                    Navigator.pop(context, newUser); // 🔁 Return the new user
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
