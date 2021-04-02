import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';

class ContentScroll extends StatelessWidget {
  final String images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });

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
  Future _alertaIos(BuildContext context) {
    AlertDialog alerta = new AlertDialog(
      content: Text('Para más información accede a nuestra página web.'),
      title: Text('thefitmode.com'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Row(
            children: <Widget>[
              Text('Volver  ', style: TextStyle(fontSize: 17.0)),
              Icon(FontAwesomeIcons.undo),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, child: alerta);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //SEGUNDO BOTON EN LAS RUTINAS.
//        Padding(
//          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                title,
//                style: TextStyle(
//                  fontSize: 25.0,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
//              GestureDetector(
//                onTap: () => print('View $title'),
//                child: RawMaterialButton(
//                  padding: EdgeInsets.all(10.0),
//                  elevation: 12.0,
//                  onPressed: () {
//                    //Condicional IOS ANDROID
//                    if (defaultTargetPlatform == TargetPlatform.iOS) {
//                      _alertaIos(context);
//                    } else {
//                      _launchInBrowser("https://www.thefitmode.com/planes/");
//                    }
//                  },
//                  shape: CircleBorder(),
//                  fillColor: Colors.white,
//                  child: Icon(
//                    Icons.play_arrow,
//                    size: 40.0,
//                    color: Colors.red,
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage("assets/rutinas/$images$index.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
