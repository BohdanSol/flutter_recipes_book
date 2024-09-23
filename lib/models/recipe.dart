class Recipe {
  final String title;
  final String imageUrl;
  final String sourceUrl;

  Recipe(
      {required this.title, required this.imageUrl, required this.sourceUrl});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      imageUrl: json['image_url'],
      sourceUrl: json['source_url'],
    );
  }
}
