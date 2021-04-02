import 'package:flutter/material.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'main.dart';

class mensaje_page2 extends StatelessWidget {
  final String image = "assets/images/logo_solo.png";
  //recibe data de main.dart con el clave de firebase.
  mensaje_page2(this.data);
  final String data;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('MENSAJE')),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () {
            Navigator.of(context).pop();
            runApp(MaterialApp(home: BottomNavBar()));
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Colors.white,
        ),
      ),
      body: Stack(
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
                                )),
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
                          data,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 18.0),
                        ),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ),
              ),
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
                    _launchInBrowser("https://fitmodeco.com");
                  },
                  child: Text(
                    "Visitanos en \nfitmodeco.com",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
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
