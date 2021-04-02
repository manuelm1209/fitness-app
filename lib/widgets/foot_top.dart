import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/model/recipe_model.dart';
import 'package:fitmodeco_navbar/pages/myrecipes/view_my_recipe.dart';
//pruebas de mostrar recetas privadas
import 'package:fitmodeco_navbar/login_admin/contentPage.dart';

class CommonThings {
  static Size size;
}

TextEditingController phoneInputController;
TextEditingController nameInputController;
String id;
final db = Firestore.instance;
String name;

class FoodTop extends StatefulWidget {
  FoodTop({this.auth, this.onSignedOut, this.id});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String id;

  @override
  _FoodTopState createState() => _FoodTopState();
}

class _FoodTopState extends State<FoodTop> {
  String userID;
  String id;
  //Widget content;
  //Mas pruebas para mostrar recetas privadas en homepageR.
  Content page = ContentPage();

  Widget contentPage = FoodTop(); //Pagina principal recetas

  @override
  void initState() {
    super.initState();

    setState(() {
      Auth().currentUser().then((onValue) {
        userID = onValue;
        //print('print userid $userID');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height *
        0.15; // set height to 40% of the screen height
    //return Container(
    return StreamBuilder(
      stream: Firestore.instance
          .collection('usuarios')
          .document(widget.id)
          .collection('mycolrecipes')
          .snapshots(),

//      height: height,
//      width: double.infinity,
//      color: Colors.white,
//      child: StreamBuilder(
//        stream: Firestore.instance.collection("colrecipes").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text("Cargando....");
        } else {
          if (snapshot.data.documents.length == 0) {
            return Text("Aún no tienes recetas,\nañade alguna para empezar...");
          } else {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.documents.map((document) {
                  return Row(
                    children: <Widget>[
                      InkWell(
//                        onTap: () {
//                          Recipe recipe = Recipe(
//                            name: document['name'].toString(),
//                            image: document['image'].toString(),
//                            ingredients: document['ingredients'].toString(),
//                            recipe: document['recipe'].toString(),
//                          );
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => ViewMyRecipe(
//                                      recipe: recipe,
//                                      idRecipe: document.documentID,
//                                      uid: userID)));
//                        },
                        child: Container(
                          height: 100.0,
                          margin: EdgeInsets.only(right: 5.0),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      width: 65,
                                      height: 65,
                                      placeholder: AssetImage(
                                          'assets/images/azucar.gif'),
                                      image: NetworkImage(document["image"]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        document["name"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          }
        }
      },
      //),
    );
  }
}
