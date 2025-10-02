import 'package:flutter/material.dart';
import 'package:grocery_app/Model/catagory_model.dart';
import 'package:grocery_app/Views/grocery_app_main_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroceryAppMainScreen(),
    );
  }
}
