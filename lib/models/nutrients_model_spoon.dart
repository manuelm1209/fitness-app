class Nutrient {
  final String calories;
  final String carbs;
  final String fat;
  final String protein;
  // Equipment
  // Ingredients
  // Steps
  // etc.

  Nutrient({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
  });

  factory Nutrient.fromMap(Map<String, dynamic> map) {
    return Nutrient(
      calories: map['calories'],
      carbs: map['carbs'],
      fat: map['fat'],
      protein: map['protein'],
    );
  }
}
