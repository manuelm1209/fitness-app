import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/model/recipe_model.dart';
import 'package:fitmodeco_navbar/pages/myrecipes/add_my_recipe.dart';
import 'package:fitmodeco_navbar/pages/myrecipes/edit_my_recipe.dart';
import 'package:fitmodeco_navbar/pages/myrecipes/view_my_recipe.dart';

class CommonThings {
  static Size size;
}

TextEditingController phoneInputController;
TextEditingController nameInputController;
String id;
final db = Firestore.instance;
String name;

class ListMyRecipe extends StatefulWidget {
  final String id;

  ListMyRecipe({this.auth, this.onSignedOut, this.id});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _ListMyRecipeState createState() => _ListMyRecipeState();
}

class _ListMyRecipeState extends State<ListMyRecipe> {
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
    CommonThings.size = MediaQuery.of(context).size;
    return new Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('usuarios')
            .document(widget.id)
            .collection('mycolrecipes')
            .snapshots(),
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
                            '\nNo tienes\n'
                            'ninguna receta aún.\n\n'
                            'Presiona el botón\n'
                            'de agregar "+" en la\n'
                            'parte inferior derecha\n'
                            'de la pantalla\n'
                            'para iniciar tu\n'
                            'lista de recetas.\n',
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              //print("from the streamBuilder: "+ snapshot.data.documents[]);
              // print(length.toString() + " doc length");

              return ListView(
                children: snapshot.data.documents.map((document) {
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                              placeholder:
                                  AssetImage('assets/images/azucar.gif'),
                              image: NetworkImage(document["image"]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              document['name'].toString().toUpperCase(),
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            //Ver la receta.
                            onTap: () {
                              Recipe myrecipe = Recipe(
                                name: document['name'].toString(),
                                image: document['image'].toString(),
                                ingredients: document['ingredients'].toString(),
                                recipe: document['recipe'].toString(),
                                category: document['category'].toString(),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewMyRecipe(
                                      recipe: myrecipe,
                                      idRecipe: document.documentID,
                                      uid: userID),
                                ),
                              );
                            },
                          ),
                        ),
                        new Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                //eliminamos la receta personal
                                document.data.remove('key');
                                Firestore.instance
                                    .collection('usuarios/$userID/mycolrecipes')
                                    .document(document.documentID)
                                    .delete();
                                //eliminamos la foto
                                FirebaseStorage.instance
                                    .ref()
                                    .child(
                                        'usuarios/$userID/mycolrecipes/${document['name'].toString()}.jpg')
                                    .delete()
                                    .then((onValue) {
                                  //print('Receta eliminada');
                                });
                              }, //funciona
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black87,
                              ),
                              //Visualizar la receta,
                              onPressed: () {
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
                                        builder: (context) => EditMyRecipe(
                                            recipe: recipe,
                                            idRecipe: document.documentID,
                                            uid: userID)));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => MyAddRecipe());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
