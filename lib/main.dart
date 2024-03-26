
import 'package:carbon_foot_print/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "碳足迹计算器",
      theme:
      ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
      ),),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: const LoginPage( enterAfterSuccess: true,),
    );
  }
}
