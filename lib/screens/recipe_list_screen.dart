import 'package:flutter/material.dart';
import '../data/recipes.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // Add the border radius
                child: Image.network(
                  recipe.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(recipe.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
