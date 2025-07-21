import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {'title': 'Weekly Report', 'summary': 'Summary of weekly user activity'},
    {'title': 'Monthly Summary', 'summary': 'Performance of users this month'},
    {'title': 'Error Logs', 'summary': 'System and user error logs'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (_, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(reports[index]['title']!),
              subtitle: Text(reports[index]['summary']!),
            ),
          );
        },
      ),
    );
  }
}
