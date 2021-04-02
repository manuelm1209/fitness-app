import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/widgets/food_body.dart';
//import 'package:fitmodeco_navbar/widgets/foot_top.dart';

class HomePageRecipes extends StatefulWidget {
  @override
  _HomePageRecipesState createState() => _HomePageRecipesState();
}

class _HomePageRecipesState extends State<HomePageRecipes> {
  String userID;

  @override
  void initState() {
    super.initState();

    setState(() {
      Auth().currentUser().then((onValue) {
        userID = onValue;
        //print('el futuro Cheft $userID');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //esta es la parte superior de la pantalla de inicio que corre lateralmente con recetas.
//          Ink(
//            color: Colors.redAccent,
//            child: Align(
//              alignment: Alignment.topCenter,
//              child: Container(
//                child: Text(
//                  'Categorías',
//                  style: TextStyle(
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white),
//                ),
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//            child: FoodTop(id: id),
//          ),
          Ink(
            color: Colors.redAccent,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Text(
                  'Recetas Comunidad',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: FoodBody(),
          ),
        ],
      ),
    );
  }
}
