class Meal {
  final int id;
  final String title;
  final String imageUrl;
  final int readyInMinutes;
  final int servings;

  Meal({
    this.id,
    this.title,
    this.imageUrl,
    this.readyInMinutes,
    this.servings,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      imageUrl: 'https://spoonacular.com/recipeImages/' + map['image'],
      readyInMinutes: map['readyInMinutes'],
      servings: map['servings'],
    );
  }
}
