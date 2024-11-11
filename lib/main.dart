import 'package:david_static_login/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD8YoQ7sXRjXYvA_uGUi_rILzl63esu99A",
        appId: "1:990520774550:android:e081a7d949c6631df657b7",
        messagingSenderId: "990520774550",
        projectId: "static-login-a1f58"
    )
  );

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
