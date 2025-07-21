import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../widgets/user_card.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<UserModel> users = [];
  List<UserModel> filteredUsers = [];
  bool isAscending = true;
  String query = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];
      setState(() {
        users = results.map((e) => UserModel.fromJson(e)).toList();
        filteredUsers = [...users];
      });
    }
  }

  void searchUsers(String input) {
    setState(() {
      query = input;
      filteredUsers = users
          .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void sortUsers() {
    setState(() {
      isAscending = !isAscending;
      filteredUsers.sort((a, b) => isAscending
          ? a.name.compareTo(b.name)
          : b.name.compareTo(a.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(isAscending ? Icons.sort_by_alpha : Icons.sort),
            onPressed: sortUsers,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: searchUsers,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (_, index) => UserCard(user: filteredUsers[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Red button for Reports
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.red,
              ),
            ),
            child: FloatingActionButton.extended(
              heroTag: 'report',
              onPressed: () => Navigator.pushNamed(context, '/reports'),
              label: Text('Reports'),
              icon: Icon(Icons.assessment),
            ),
          ),
          SizedBox(height: 10),
          //Green button for Create User
          Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.green,
              ),
            ),
            child: FloatingActionButton.extended(
              heroTag: 'create',
              onPressed: () async {
                final newUser = await Navigator.pushNamed(context, '/create');

                if (newUser != null && newUser is UserModel) {
                  setState(() {
                    users.add(newUser);
                    if (newUser.name.toLowerCase().contains(query.toLowerCase())) {
                      filteredUsers.add(newUser);
                    }
                  });
                }
              },
              label: Text('Create User'),
              icon: Icon(Icons.person_add),
            ),
          ),
        ],
      ),
    );
  }
}
