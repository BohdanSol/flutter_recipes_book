import 'package:flutter/material.dart';
import '../data/recipes.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Add the border radius
              child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(recipe.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(recipe.description),
          ],
        ),
      ),
    );
  }
}
