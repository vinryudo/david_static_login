// main.dart
import 'package:david_static_login/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(), // Set RegisterPage as the home page
      debugShowCheckedModeBanner: false,
    );
  }
}
