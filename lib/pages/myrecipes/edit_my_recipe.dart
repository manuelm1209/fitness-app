import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart' as img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fitmodeco_navbar/model/recipe_model.dart';

class EditMyRecipe extends StatefulWidget {
  EditMyRecipe({this.recipe, this.idRecipe, this.uid});
  final String idRecipe;
  final String uid;
  final Recipe recipe; //model/

  @override
  _EditMyRecipeState createState() => _EditMyRecipeState();
}

enum SelectSource { camara, galeria }

class _EditMyRecipeState extends State<EditMyRecipe> {
  final formKey = GlobalKey<FormState>();
  String _name;
  String _recipe;
  String _ingredients;
  File _image; //
  String urlFoto = '';
  Auth auth = Auth();
  bool _isInAsyncCall = false;
  String usuario;
  String _itemCategoria;
  List<DropdownMenuItem<String>> _categoriaItems; //list city from Firestore

  BoxDecoration box = BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.black),
      shape: BoxShape.circle,
      image: DecorationImage(
          fit: BoxFit.fill, image: AssetImage('assets/images/azucar.gif')));

  @override
  void initState() {
    setState(() {
      this._name = widget.recipe.name;
      this._recipe = widget.recipe.recipe;
      this._ingredients = widget.recipe.ingredients;
      this._itemCategoria = widget.recipe.category;
      captureImage(null, widget.recipe.image);
      _categoriaItems = getCategoriaItems();
      _itemCategoria = _categoriaItems[0].value;
    });

    //print('uid receta : ' + widget.idRecipe);
    super.initState();
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

  static var httpClient = new HttpClient();
  Future<File> _downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future captureImage(SelectSource opcion, String url) async {
    File image;
    if (url == null) {
      //print('imagen');
      opcion == SelectSource.camara
          ? image = await img.ImagePicker.pickImage(
              source: img.ImageSource.camera) //source: ImageSource.camera)
          : image =
              await img.ImagePicker.pickImage(source: img.ImageSource.gallery);

      setState(() {
        _image = image;
        box = BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.fill, image: FileImage(_image)));
      });
    } else {
      //print('descarga la imagen');
      _downloadFile(url, widget.recipe.name).then((onValue) {
        _image = onValue;
        setState(() {
          box = BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              shape: BoxShape.circle,
              image:
                  DecorationImage(fit: BoxFit.fill, image: FileImage(_image)));
          ////  imageReceta = FileImage(_foto);
        });

        // : FileImage(_imagen)))
      });
    }
  }

  Future getImage() async {
    AlertDialog alerta = new AlertDialog(
      content: Text('¿De donde quieres tomar la imagen?'),
      title: Text('Seleccione Imagen'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            // seleccion = SelectSource.camara;
            captureImage(SelectSource.camara, null);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Row(
            children: <Widget>[Text('Camara'), Icon(Icons.camera)],
          ),
        ),
        FlatButton(
          onPressed: () {
            // seleccion = SelectSource.galeria;
            captureImage(SelectSource.galeria, null);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Row(
            children: <Widget>[Text('Galeria'), Icon(Icons.image)],
          ),
        )
      ],
    );
    showDialog(context: context, child: alerta);
  }

  bool _validar() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _enviar() {
    if (_validar()) {
      setState(() {
        _isInAsyncCall = true;
      });
      auth.currentUser().then((onValue) {
        setState(() {
          usuario = onValue;
        });
        if (_image != null) {
          final StorageReference fireStoreRef = FirebaseStorage.instance
              .ref()
              .child('mycolrecipes')
              .child('$_name.jpg');
          final StorageUploadTask task = fireStoreRef.putFile(
              _image, StorageMetadata(contentType: 'image/jpeg'));

          task.onComplete.then((onValue) {
            onValue.ref.getDownloadURL().then((onValue) {
              setState(() {
                urlFoto = onValue.toString();
                Firestore.instance
                    .collection('usuarios')
                    .document(usuario)
                    .collection('mycolrecipes')
                    .document(widget.idRecipe)
                    .updateData({
                      'name': _name,
                      'image': urlFoto,
                      'recipe': _recipe,
                      'ingredients': _ingredients,
                      'category': _itemCategoria,
                    })
                    .then((value) => Navigator.of(context).pop())
                    .catchError((onError) =>
                        print('Error al editar la receta en la bd'));
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
                'name': _name,
                'image': urlFoto,
                'recipe': _recipe,
                'ingredientes': _ingredients,
                'category': _itemCategoria,
              })
              .then((value) => Navigator.of(context).pop())
              .catchError(
                  (onError) => print('Error editar el usuario en la bd'));
          _isInAsyncCall = false;
        }
      }).catchError((onError) => _isInAsyncCall = false);
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
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
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
                            decoration: box)
                      ]),
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
                    keyboardType: TextInputType.text,
                    initialValue: _name,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      labelText: 'Título',
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'El campo título esta vacio' : null,
                    onSaved: (value) => _name = value.trim(),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    //Problema con crear nueva linea resuelto.
                    //keyboardType: TextInputType.text,
                    initialValue: _ingredients,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      labelText: 'Ingredientes',
                    ),
                    validator: (value) => value.isEmpty
                        ? 'El campo ingredientes esta vacio'
                        : null,
                    onSaved: (value) => _ingredients = value.trim(),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    //Problema con crear nueva linea resuelto.
                    //keyboardType: TextInputType.text,
                    initialValue: _recipe,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      labelText: 'Receta',
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'El campo receta esta vacio' : null,
                    onSaved: (value) => _recipe = value.trim(),
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _enviar,
                        child: Text('Guardar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          )),
    );
  }
}
