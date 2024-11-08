import 'package:flutter/material.dart';
import 'package:projectmobile/page/account/login.dart';
import 'package:projectmobile/page/account/profile.dart';
import 'package:projectmobile/page/dashboard.dart';
import 'package:projectmobile/page/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false
      ,
    );
  }
}
