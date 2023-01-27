import 'package:flutter/material.dart';
import 'package:project_2/pages/auth.dart';
import 'package:project_2/pages/home.dart';
import 'package:project_2/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login ',
      home: AuthPage(),
    );
  }
}
