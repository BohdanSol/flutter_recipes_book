class Recipe {
  final String title;
  final String imageUrl;
  final String description;

  Recipe(
      {required this.title, required this.imageUrl, required this.description});
}

final List<Recipe> recipes = [
  Recipe(
    title: 'Spaghetti Carbonara',
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1001491_11-2e0fa5c.jpg?quality=90&resize=440,400',
    description:
        'A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.',
  ),
  Recipe(
    title: 'Chicken Curry',
    imageUrl:
        'https://feastwithsafiya.com/wp-content/uploads/2022/03/chicken-curry-recipe.jpg',
    description: 'A flavorful chicken curry made with aromatic spices.',
  ),
  Recipe(
    title: 'Shrimp Scampi',
    imageUrl:
        'https://static01.nyt.com/images/2022/06/02/dining/ShrimpScampi_thumb/ShrimpScampi_thumb-square640.jpg',
    description:
        'A delicious shrimp scampi made with garlic, butter, and white wine.',
  ),
  Recipe(
    title: 'Pancakes',
    imageUrl:
        'https://www.allrecipes.com/thmb/WqWggh6NwG-r8PoeA3OfW908FUY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/21014-Good-old-Fashioned-Pancakes-mfs_001-1fa26bcdedc345f182537d95b6cf92d8.jpg',
    description: 'Fluffy pancakes served with maple syrup and butter.',
  ),
];
