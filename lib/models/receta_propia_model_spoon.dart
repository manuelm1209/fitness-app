import 'package:fitmodeco_navbar/models/ingredients_plan_model_spoon.dart';

class Recipe2 {
  final List<ExtendedIngredient> extendedIngredients;
  final int id;
  final String sourceUrl;
  // Equipment
  // Ingredients
  // Steps
  // etc.

  Recipe2({
    this.extendedIngredients,
    this.id,
    this.sourceUrl,
  });

  factory Recipe2.fromMap(Map<String, dynamic> map) {
    //
    List<ExtendedIngredient> extendedIngredients = [];
    map['extendedIngredients'].forEach((extendedIngredientMap) =>
        extendedIngredients
            .add(ExtendedIngredient.fromMap(extendedIngredientMap)));
    //

    return Recipe2(
      extendedIngredients: extendedIngredients,
      id: map['id'],
      sourceUrl: map['sourceUrl'],
    );
  }
}
