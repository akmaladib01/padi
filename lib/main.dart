import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:padi/user/authentication/login.dart';
import 'package:padi/user/authentication/signup.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sawah Check App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signup(),
    );
  }
}
