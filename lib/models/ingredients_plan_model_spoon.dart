class ExtendedIngredient {
  final String name;

  ExtendedIngredient({
    this.name,
  });

  factory ExtendedIngredient.fromMap(Map<String, dynamic> map) {
    return ExtendedIngredient(
      name: map['name'],
    );
  }
}
