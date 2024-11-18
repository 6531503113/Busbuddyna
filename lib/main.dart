import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/HomePage.dart';
import 'screen/login.dart';
import 'screen/home.dart';
import 'screen/table.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // เรียกใช้ Firebase.initializeApp()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
