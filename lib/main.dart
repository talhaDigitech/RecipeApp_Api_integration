import 'package:flutter/material.dart';
import 'package:recipe_api_integration/Screens/foodListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodListScreen(),
    );
  }
}