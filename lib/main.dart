import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatelessWidget {
  const RecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RecipeListScreen(),
    );
  }
}
