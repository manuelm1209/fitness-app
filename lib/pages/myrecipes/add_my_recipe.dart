import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';

class CommonThings {
  static Size size; //size screen
}

class MyAddRecipe extends StatefulWidget {
  final String id;
  const MyAddRecipe({this.id});

  @override
  _MyAddRecipeState createState() => _MyAddRecipeState();
}

enum SelectSource { camara, galeria }

class _MyAddRecipeState extends State<MyAddRecipe> {
  File _foto;
  String urlFoto;
  bool _isInAsyncCall = false;
  String recipes;
  Auth auth = Auth();

  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;
  TextEditingController ingredientsInputController;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String uid;
  String recipe;
  String usuario;
  String ingredients;
  String _itemCategoria;
  List<DropdownMenuItem<String>> _categoriaItems; //list city from Firestore

  Future captureImage(SelectSource opcion) async {
    File image;

    opcion == SelectSource.camara
        ? image = await ImagePicker.pickImage(source: ImageSource.camera)
        : image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _foto = image;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _categoriaItems = getCategoriaItems();
      _itemCategoria = _categoriaItems[0].value;
    });
  }

  getData() async {
    return await Firestore.instance.collection('categorias').getDocuments();
  }

  //Dropdownlist from firestore
  List<DropdownMenuItem<String>> getCategoriaItems() {
    List<DropdownMenuItem<String>> items = List();
    QuerySnapshot dataCategorias;
    getData().then((data) {
      dataCategorias = data;
      dataCategorias.documents.forEach((obj) {
        //print('${obj.documentID} ${obj['name']}');
        items.add(DropdownMenuItem(
          value: obj.documentID,
          child: Text(obj['name']),
        ));
      });
    }).catchError((error) => print('hay un error.....' + error));

    items.add(DropdownMenuItem(
      value: '0',
      child: Text('- Seleccione -'),
    ));

    return items;
  }

  Future getImage() async {
    AlertDialog alerta = new AlertDialog(
      content: Text('¿De donde desea tomar la imagen?'),
      title: Text('Seleccione Imagen'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            // seleccion = SelectSource.camara;
            captureImage(SelectSource.camara);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Row(
            children: <Widget>[
              Text('Camara ', style: TextStyle(fontSize: 17.0)),
              Icon(FontAwesomeIcons.camera),
            ],
          ),
        ),
        FlatButton(
          onPressed: () {
            // seleccion = SelectSource.galeria;
            captureImage(SelectSource.galeria);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Row(
            children: <Widget>[
              Text('Galeria ', style: TextStyle(fontSize: 17.0)),
              Icon(FontAwesomeIcons.images),
            ],
          ),
        )
      ],
    );
    showDialog(context: context, child: alerta);
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  bool _validarlo() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _enviar() {
    if (_validarlo()) {
      setState(() {
        _isInAsyncCall = true;
      });
      auth.currentUser().then((onValue) {
        setState(() {
          usuario = onValue;
        });
        if (_foto != null) {
          final StorageReference fireStoreRef = FirebaseStorage.instance
              .ref()
              .child('usuarios')
              .child(usuario)
              .child('mycolrecipes')
              .child('$name.jpg');
          final StorageUploadTask task = fireStoreRef.putFile(
              _foto, StorageMetadata(contentType: 'image/jpeg'));
          task.onComplete.then((onValue) {
            onValue.ref.getDownloadURL().then((onValue) {
              setState(() {
                urlFoto = onValue.toString();
                Firestore.instance
                    .collection('usuarios')
                    .document(usuario)
                    .collection('mycolrecipes')
                    .add({
                      'name': name,
                      'image': urlFoto,
                      'recipe': recipe,
                      'ingredients': ingredients,
                      'category': _itemCategoria,
                    })
                    .then((value) => Navigator.of(context).pop())
                    .catchError(
                        (onError) => print('Error al registrar su receta bd'));
                _isInAsyncCall = false;
              });
            });
          });
        } else {
          Firestore.instance
              .collection('usuarios')
              .document(usuario)
              .collection('mycolrecipes')
              .add({
                'name': name,
                'image':
                    "https://firebasestorage.googleapis.com/v0/b/fitmodeco-push.appspot.com/o/assets%2Fno-image.png?alt=media&token=a4b88c32-f591-4935-9ab3-b4ca921dfa41",
                'recipe': recipe,
                'ingredients': ingredients,
                'category': _itemCategoria,
              })
              .then((value) => Navigator.of(context).pop())
              .catchError(
                  (onError) => print('Error al registrar su receta bd'));
          _isInAsyncCall = false;
        }
      }).catchError((onError) => _isInAsyncCall = false);

      //

    } else {
      //print('objeto no validado');
    }
  }

  final String logoBar = "assets/images/logo_completo_blanco.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image(
              image: AssetImage(
                logoBar,
              ),
              height: 90.0,
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          opacity: 0.5,
          dismissible: false,
          progressIndicator: CircularProgressIndicator(),
          color: Colors.blueGrey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: GestureDetector(
                          onTap: getImage,
                        ),
                        margin: EdgeInsets.only(top: 20),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: _foto == null
                                ? AssetImage('assets/images/azucar.gif')
                                : FileImage(_foto),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text('Toca para cambiar foto'),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  DropdownButtonFormField(
                    validator: (value) =>
                        value == '0' ? 'Debe seleccionar una categoría' : null,
                    decoration: InputDecoration(
                        labelText: 'Categoría',
                        icon: Icon(FontAwesomeIcons.sitemap)),
                    value: _itemCategoria,
                    items: _categoriaItems,
                    onChanged: (value) {
                      setState(() {
                        _itemCategoria = value;
                      });
                    }, //seleccionarPaisItem,
                    onSaved: (value) => _itemCategoria = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Título',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor introduce el título';
                      }
                    },
                    onSaved: (value) => name = value.trim(),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ingredientes',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor introduce los ingredientes';
                      }
                    },
                    onSaved: (value) => ingredients = value,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Receta',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor introduce la receta';
                      }
                    },
                    onSaved: (value) => recipe = value,
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _enviar,
                        child: Text('Crear',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ));
  }
}
