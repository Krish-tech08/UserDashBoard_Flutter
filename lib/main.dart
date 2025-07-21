import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/report_screen.dart';
import 'screens/create_user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Dashboard App',
      debugShowCheckedModeBanner: false, // ✅ removes debug banner
      theme: ThemeData(
        brightness: Brightness.dark, // 🌑 Black theme
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white10,
          hintStyle: TextStyle(color: Colors.white60),
          prefixIconColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      themeMode: ThemeMode.dark, // ✅ Always use dark mode
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/reports': (context) => ReportScreen(),
        '/create': (context) => CreateUserScreen(),
      },
    );
  }
}
