import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart' as img;
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/model/recipe_model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fitmodeco_navbar/widgets/circular_clipper.dart';

class ViewMyRecipe extends StatefulWidget {
  ViewMyRecipe({this.recipe, this.idRecipe, this.uid});
  final String idRecipe;
  final String uid;
  final Recipe recipe;

  @override
  _ViewMyRecipeState createState() => _ViewMyRecipeState();
}

enum SelectSource { camara, galeria }

class _ViewMyRecipeState extends State<ViewMyRecipe> {
  final formKey = GlobalKey<FormState>();
  String _name;
  String _recipe;
  String _ingredients;
  String urlFoto = '';
  Auth auth = Auth();
  String usuario;
  String image2;
  String _categoria;

  BoxDecoration box = BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.black),
      shape: BoxShape.rectangle,
      image: DecorationImage(
          fit: BoxFit.fill, image: AssetImage('assets/images/azucar.gif')));

  @override
  void initState() {
    setState(() {
      this._name = widget.recipe.name;
      this._recipe = widget.recipe.recipe;
      this._ingredients = widget.recipe.ingredients;
      this.image2 = widget.recipe.image;
      this._categoria = widget.recipe.category;
    });

    //print('uid receta : ' + widget.idRecipe);
    super.initState();
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
                  tag: _name,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(image2),
                    ),
//                    child: Image(
//                      height: 400.0,
//                      width: double.infinity,
//                      fit: BoxFit.cover,
//                      image: FileImage(_image),
//                    ),
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
//              Positioned.fill(
//                bottom: 0.0,
//                child: Align(
//                  alignment: Alignment.bottomCenter,
//                  child: RawMaterialButton(
//                    padding: EdgeInsets.all(10.0),
//                    elevation: 12.0,
//                    onPressed: () {
//                      print(image2);
//                    },
//                    shape: CircleBorder(),
//                    fillColor: Colors.white,
//                    child: Icon(
//                      Icons.play_arrow,
//                      size: 60.0,
//                      color: Colors.red,
//                    ),
//                  ),
//                ),
//              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
                Text(
                  "Categoría: $_categoria",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
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
                SizedBox(height: 10.0),
                Text(
                  _ingredients,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  "Receta",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Text(
                    _recipe,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
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
