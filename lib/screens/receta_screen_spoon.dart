import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/models/receta_propia_model_spoon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitmodeco_navbar/widgets/circular_clipper.dart';
import 'package:fitmodeco_navbar/models/ingredients_plan_model_spoon.dart';
import 'package:fitmodeco_navbar/screens/sourceUrl_screen_spoon.dart';
import 'package:fitmodeco_navbar/models/nutrients_model_spoon.dart';

class RecetaScreen extends StatefulWidget {
  final String mealType;
  final Recipe2 recipe;
  final String imageUrl;
  final String tituloReceta;
  final int readyInMinutes;
  final Nutrient nutrient;
  final int servings;

  RecetaScreen({
    this.mealType,
    this.recipe,
    this.imageUrl,
    this.tituloReceta,
    this.readyInMinutes,
    this.nutrient,
    this.servings,
  });

  @override
  _RecetaScreenState createState() => _RecetaScreenState();
}

class _RecetaScreenState extends State<RecetaScreen> {
  _listIngredients(ExtendedIngredient extendedIngredient, int index) {
    return Container(
      child: Text(
        (index + 1).toString() + ". " + extendedIngredient.name,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              new Container(
                height: 450.0,
                //IOS Y ANDROID.
                transform: defaultTargetPlatform == TargetPlatform.iOS
                    ? Matrix4.translationValues(0.0, -45.0, 0.0)
                    : Matrix4.translationValues(0.0, -25.0, 0.0),
                child: new Hero(
                  tag: widget.tituloReceta,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => Navigator.pop(context),
                    shape: CircleBorder(),
                    fillColor: Colors.redAccent,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //
          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.tituloReceta,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
                Text(
                  widget.mealType,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  "Nutrientes",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Cals: " + widget.nutrient.calories + "cal",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Carbs: " + widget.nutrient.carbs,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Grasas: " + widget.nutrient.fat,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Prot: " + widget.nutrient.protein,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  "Receta para:",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.servings.toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Icon(
                        FontAwesomeIcons.userAlt,
                        color: Colors.black87,
                        size: 25.0,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  "Tiempo de preparación",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.readyInMinutes.toString() + " mins",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        color: Colors.black87,
                        size: 25.0,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  "Ingredientes",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),

                //PRUEBA INGREDIENTES.
                Container(
                  color: Colors.grey.shade200,
                  height: 300.0,
                  child: ListView.builder(
                    itemCount: widget.recipe.extendedIngredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      //if (index != 30) {
                      ExtendedIngredient extendedIngredients =
                          widget.recipe.extendedIngredients[index];
                      return _listIngredients(extendedIngredients, index);
                      //}
                      //;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          Center(
            child: Text(
              "¿Te interesa esta receta?",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              "Puedes verla completa",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
              ),
            ),
          ),
          Center(
            child: Text(
              "en su fuente",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          RecipeScreen(sourceUrl: widget.recipe.sourceUrl),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Ver",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Icon(
                      FontAwesomeIcons.playCircle,
                      color: Colors.white,
                      size: 35.0,
                    )
                  ],
                ),
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
              ),
            ],
          ),
          SizedBox(height: 80.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Regresar",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Icon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      color: Colors.white,
                    )
                  ],
                ),
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ],
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
