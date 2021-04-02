//Página de la calculadora de masa corporal.
import 'dart:math';
import 'dart:ui' as ui;

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/HomePage.dart';

class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC', //indice de masa corporal
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<MyCalculator> {
  final controller_peso = TextEditingController();
  final controller_talla = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  final d = Decimal;

  String muestreImc = "";
  String pesoSugerido = "";

  //creamos la clase para calcular peso mujer
  void pesoIdealMujer() {
    int pesoidealm = 21;
    int decimals = 2; //solo me muestre dos decimales
    int fad = pow(10, decimals); //formula mayor a 10 decimales

    //realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * fad).round() / fad;

      //formula para sugerir el peso de la persona
      double sugerido = (pesoidealm * peso) / d;
      sugerido = (sugerido * fad).round() / fad;

      setState(() {
        muestreImc = "IMC es: $d";
      });

      setState(() {
        pesoSugerido = "Peso promedio es: $sugerido Kg";
      });
    }
  }

  //formula para el hombre
  void pesoIdealHombre() {
    int pesoidealh = 24;
    int decimals = 2; //solo me muestre dos decimales
    int fad = pow(10, decimals); //formula mayor a 10 decimales

    //realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * fad).round() / fad;

      //formula para sugerir el peso de la persona
      double sugerido = (pesoidealh * peso) / d;
      sugerido = (sugerido * fad).round() / fad;

      setState(() {
        muestreImc = "IMC es: $d";
      });

      setState(() {
        pesoSugerido = "Peso promedio es: $sugerido Kg";
      });
    }
  }

//ahora realizaremos el layout o diseño de nuestra calculadora
//de indice de masa corporal
  @override
  Widget build(BuildContext context) {
    final String logoBar = "assets/images/logo_completo_blanco.png";
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
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
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () {
            Navigator.of(context).pop();
            //Codigo para llamar una pagina sin poner rout al inicio.
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
          key: my_form_key,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: new Image(
                            width: 200.0,
                            height: 150.0,
                            image: new AssetImage('assets/images/scale.png'),
                          ),
                        )
                      ],
                    ),
                  ),

                  //agregamos un Container
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 3)
                              ]),
                          child: TextFormField(
                            controller: controller_peso,
                            validator: (value) {
                              if (value.isEmpty) return "Digita el Peso Kg";
                            },
                            decoration: InputDecoration(
                                hintText: "Peso Kg",
                                icon: Icon(Icons.accessibility,
                                    color: Colors.grey.shade800)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(),
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 3)
                              ]),
                          child: TextFormField(
                            controller: controller_talla,
                            validator: (value) {
                              if (value.isEmpty) return "Digita Estatura Cm";
                            },
                            decoration: InputDecoration(
                                hintText: "Estatura Cm",
                                icon: Icon(Icons.present_to_all,
                                    color: Colors.grey.shade800)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: pesoIdealMujer,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red.shade300,
                        padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person, color: Colors.white),
                            Text(
                              'Mujer',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      FlatButton(
                        onPressed: pesoIdealHombre,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.lightBlueAccent,
                        padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person, color: Colors.white),
                            Text('Hombre',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.0,
                  ),
                  //caja de resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultado del TextFormField
                    child: Center(
                      child: Text(
                        muestreImc,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultador del TextFormField
                    child: Center(
                      child: Text(
                        pesoSugerido,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 50,
                  ),
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 300.0,
                            height: 200.0,
                            image: new AssetImage('assets/images/imcx.png'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
