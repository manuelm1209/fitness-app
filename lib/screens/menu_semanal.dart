import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Para identificar si IOS o ANDROID
import 'package:flutter/foundation.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MenuSemanal extends StatefulWidget {
  @override
  _MenuSemanalState createState() => _MenuSemanalState();
}

class _MenuSemanalState extends State<MenuSemanal> {
  final String logoBar = "assets/images/logo_completo_blanco.png";
  final String imageCircular = "assets/images/logo_solo_circular.png";

  //Abrir navegador con url.
  Future<void> _launchInBrowser(String url2) async {
    if (await canLaunch(url2)) {
      await launch(
        url2,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'No se pudo abrir el navegador :(';
    }
  }

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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              //EXPLICACION
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //EXPLICACION
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarCheck,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              'Explicación',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Two Column Table
                          SizedBox(height: 30.0),
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    'Desayuno',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    'Almuerzo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Cena',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Snack',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          //Button para ir a planes y obtener recetas personalizadas.
                          Container(
                            child: Text(
                              'Recibe un menú diseñado',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            child: Text(
                              'exclusivamente para ti',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: defaultTargetPlatform == TargetPlatform.iOS
                                ? Container(
                                    child: Text(
                                      'En nuestra página web',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                : RaisedButton(
                                    color: new Color(0xffffffff),
                                    child: Text(
                                      'Mi menú',
                                      style: TextStyle(
                                        color: new Color(0xffcb3a57),
                                        fontSize: 18,
                                      ),
                                    ),
                                    onPressed: () {
                                      _launchInBrowser(
                                          "https://www.thefitmode.com/planes/");
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                          ),

//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: RaisedButton(
//                              color: new Color(0xffffffff),
//                              child: Text(
//                                'Mi menú',
//                                style: TextStyle(
//                                  color: new Color(0xffcb3a57),
//                                  fontSize: 18,
//                                ),
//                              ),
//                              onPressed: () {
//                                //Condicional IOS ANDROID
//                                if (defaultTargetPlatform ==
//                                    TargetPlatform.iOS) {
//                                  _alertaIos(context);
//                                } else {
//                                  _launchInBrowser(
//                                      "https://www.thefitmode.com/planes/");
//                                }
//                              },
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(30.0),
//                              ),
//                            ),
//                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Second ListView
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Lunes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Día sin carne',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Pancakes de avena (X3),\nclaras de huevo cocinadas,\n1/4 de aguacate y fruta.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Tortilla de acelgas,\nensalada de verduras y\nlentejas cocidas.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Crema de brócoli con\naguacate y tostadas\nde arroz.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Barra de queso finess',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Martes
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Martes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Bajo en carbs',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Tortilla de 2 huevos\nbatidos, espinacas,\nchampiñones y carne\nmolida - guacate.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Camarones cocidos con\npimentón y cebollín,\npasta zucchinni y\narroz integral.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Habichuelas con\natún y\naguacate.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Fresas con yoturt\ngriego y canela.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //MIERCOLES
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Miercoles',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'De carga',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Arepa integral con\nsemillas de chía, queso\nfiness, 2 huevos fritos\nen ghee y aguacate.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Salmón a la plancha,\nmini waffles de\npapa (o papa al vapor)\ny verduras salteadas.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Pollo mechado,\nclaras de huevo\ny aguacate.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Galleta de avena\ny chips de\nchocolate.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //JUEVES
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Jueves',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'De persistencia',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Waffle de choclo,\nqueso finess y pollo\nmechado salteado\ncon zucchinni.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Filete de tilapia a\nla plancha, plátano\nmaduro asado,\nensalada de garbanzos.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Hamburguesas de\natún y verduras\nal vapor.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Kiwi con yogurt\ngriego y canela.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //VIERNES
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Viernes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '(T.G.I.F)',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Tostadas francesas\n(dulces y saladas).',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Pollo frito (u horneado),\nwaffle de brócoli,\npapas criollas salteadas\ncon verdura y ensalada.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Pechuga a la\nplancha y quesadillas\nde espinacas.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Tostadas de arroz,\nmermelada sin azúcar\ny queso cuajada.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //SABADO
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Sabado',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'De cheat meal saludable',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Two Column Table
                          DataTable(
                            dataRowHeight: 90,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Avena trasnochada\ncon banano.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.coffee,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Hamburguesa de\nplátano maduro.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.sun,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Pizza de coliflor.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.moon,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Claras de huevo con\ncanela, yogurt griego\ny mermelada de\npiña sin azúcar.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.cookieBite,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal, color: new Color(0xffffffff)),
    title: Text(
      rowVal,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
