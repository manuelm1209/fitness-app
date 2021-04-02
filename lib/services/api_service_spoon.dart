import 'dart:convert';
import 'dart:io';
import 'package:fitmodeco_navbar/models/meal_plan_model_spoon.dart';
import 'package:fitmodeco_navbar/models/receta_propia_model_spoon.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fitmodeco_navbar/models/nutrients_model_spoon.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';
  //Android - hotmail.
  static const String API_KEY = '4475729898eb46c3ae27c6509071ef41';
  //IOS - Gmail.
  static const String API_KEY_IOS = '2d166abd5d7e407d9af0a04607c92d5b';

  // Generate Meal Plan
  Future<MealPlan> generateMealPlan({int targetCalories, String diet}) async {
    if (diet == 'Ninguna') diet = '';
    print(diet);
    print(targetCalories.toString());
    Map<String, String> parameters = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      //'apiKey': API_KEY,
      'apiKey':
          defaultTargetPlatform == TargetPlatform.iOS ? API_KEY_IOS : API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/mealplans/generate',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  // Recipe Info
  Future<Recipe2> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      //'apiKey': API_KEY,
      'apiKey':
          defaultTargetPlatform == TargetPlatform.iOS ? API_KEY_IOS : API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe2 recipe = Recipe2.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }

  // Nutrient Info
  Future<Nutrient> fetchRecipe2(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      //'apiKey': API_KEY,
      'apiKey':
          defaultTargetPlatform == TargetPlatform.iOS ? API_KEY_IOS : API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/nutritionWidget.json',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Nutrient nutrient = Nutrient.fromMap(data);
      return nutrient;
    } catch (err) {
      throw err.toString();
    }
  }
}
