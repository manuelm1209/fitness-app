import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/model/recipe_model.dart';
import 'package:flutter/widgets.dart';
import 'package:fitmodeco_navbar/pages/admin/view_recipe.dart';

class FoodBody extends StatefulWidget {
  @override
  _FoodBodyState createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  String userID;
  //Widget content;

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
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: StreamBuilder(
        stream: Firestore.instance.collection("colrecipes").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Cargando....");
          } else {
            if (snapshot.data.documents.length == 0) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(15),
                      shape: BeveledRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '\nNo se ha podido\ncargar ninguna\nreceta\n'
                            ':(\n',
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: ListView(
                  children: snapshot.data.documents.map((document) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
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
                          margin: EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical: 10.0,
                          ),
                          padding:
                              EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0),
                          child: ClipRRect(
                            //recondea borde Foto dentro del Stack
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                              onTap: () {
                                Recipe recipe = Recipe(
                                  name: document['name'].toString(),
                                  image: document['image'].toString(),
                                  ingredients:
                                      document['ingredients'].toString(),
                                  recipe: document['recipe'].toString(),
                                  category: document['category'].toString(),
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewRecipe(
                                            recipe: recipe,
                                            idRecipe: document.documentID,
                                            uid: userID)));
                              },
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage(
                                        fit: BoxFit.cover,
                                        width: 350,
                                        height: 220,
                                        placeholder: AssetImage(
                                            'assets/images/azucar.gif'),
                                        image: NetworkImage(document["image"]),
                                      ),
                                    ),
                                  ),
                                  //borde para poner el la foto estrellas y titulo ...
                                  Positioned(
                                    left: 5.0,
                                    bottom: 10.0,
                                    child: Center(
                                      child: Container(
                                        height: 45.0,
                                        width: 340.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.black87,
                                                  Colors.black12
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20.0,
                                    right: 10.0,
                                    bottom: 10.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            LimitedBox(
                                              maxHeight: 45,
                                              maxWidth: 320,
                                              child: Text(
                                                document["name"].toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ), //
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
