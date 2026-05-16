import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefswithex/counter_example/counter_screen.dart';
import 'package:sharedprefswithex/login_example/home.dart';
import 'package:sharedprefswithex/login_example/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool ?isLogged;
  Future getLogin () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final savedLogin = preferences.getBool("isLogged") ?? false;
    setState(() {
      isLogged = savedLogin;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogin();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: isLogged == true ? Home() : Login(),
    );
  }
}

