import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitmodeco_navbar/Photo.dart';
import 'package:fitmodeco_navbar/HomeScreen.dart';
import 'package:fitmodeco_navbar/Timer.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomePage3(),
        routes: <String, WidgetBuilder>{
          "/Photo": (BuildContext context) => new Photo(),
          "/HomeScreen": (BuildContext context) => new HomeScreen(),
          "/Timer": (BuildContext context) => new Timer(),
        });
  }
}

class HomePage3 extends StatelessWidget {
  final String image = "assets/images/logo_solo.png";
  final String logoBar = "assets/images/logo_completo_blanco.png";

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

  //Alerta en IOS.
//  Future _alertaIos(BuildContext context) {
//    AlertDialog alerta = new AlertDialog(
//      content: Text('Para más información accede a nuestra página web.'),
//      title: Text('thefitmode.com'),
//      actions: <Widget>[
//        Text(
//          "Politicas de Apple inc.",
//          style: TextStyle(fontSize: 10.0),
//        ),
//        FlatButton(
//          onPressed: () {
//            Navigator.of(context, rootNavigator: true).pop();
//          },
//          child: Row(
//            children: <Widget>[
//              Text('Volver  ', style: TextStyle(fontSize: 17.0)),
//              Icon(FontAwesomeIcons.undo),
//            ],
//          ),
//        ),
//      ],
//    );
//    return showDialog(context: context, child: alerta);
//  }

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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade50),
              accountName: Text(
                "The FitMode",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              accountEmail: Text("admin@thefitmode.com",
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
              currentAccountPicture:
                  new CircleAvatar(backgroundImage: new AssetImage(image)),
            ),
            ListTile(
              title: Text("Calculadora IMC", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.weight),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/Photo");
              },
            ),
            ListTile(
              title: Text("Temporizador", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.stopwatch),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/Timer");
              },
            ),
            ListTile(
              title: Text("Info saludable", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.infoCircle),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/HomeScreen");
              },
            ),
            new Divider(),
            ListTile(
              title: Text("Más información:", style: TextStyle(fontSize: 20.0)),
            ),
            ListTile(
              title: Text("Instagram", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.instagram),
              onTap: () {
                Navigator.of(context).pop();
                _launchInBrowser("https://www.instagram.com/the_fitmode/");
              },
            ),
            ListTile(
              title: Text("Facebook", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.facebook),
              onTap: () {
                Navigator.of(context).pop();
                _launchInBrowser(
                    "https://www.facebook.com/Fitmodeco-107270664077633");
              },
            ),
            //Condicional para complementos Premium IOS ANDROID.
            defaultTargetPlatform == TargetPlatform.iOS
                ? new Divider()
                : Ink(
                    color: Colors.black87,
                    child: ListTile(
                      title: Text("Complementos Premium",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      trailing: Icon(
                        FontAwesomeIcons.medal,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _launchInBrowser("https://www.thefitmode.com/planes/");
                      },
                    ),
                  ),
            ListTile(
              title: Text("Cerrar", style: TextStyle(fontSize: 18.0)),
              trailing: Icon(FontAwesomeIcons.times),
              onTap: () => Navigator.of(context).pop(),
            ),
            new Divider(),
          ],
        ),
      ),
      body: defaultTargetPlatform == TargetPlatform.iOS
          ? Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Container(
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 5.0)
                            ],
                          ),
                          margin: EdgeInsets.all(50.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                "Cree en ti",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Más que fitness, \nes \nhappiness.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 18.0),
                              ),
                              SizedBox(height: 25.0),
                              Text(
                                "Powered by",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "www.thefitmode.com",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height: 25.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          : Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Container(
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 5.0)
                            ],
                          ),
                          margin: EdgeInsets.all(50.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                "Cree en ti",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Más que fitness, \nes \nhappiness.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 18.0),
                              ),
                              SizedBox(height: 25.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Condicional boton o texto para IOS o ANDROID.
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      width: double.infinity,
                      child: RaisedButton(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () {
                          _launchInBrowser("https://www.thefitmode.com");
                        },
                        child: Text(
                          "Visítanos en\nwww.thefitmode.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0),
                  ],
                )
              ],
            ),
    );
  }
}
