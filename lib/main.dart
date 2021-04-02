import 'package:fitmodeco_navbar/mensaje_page.dart';
import 'package:fitmodeco_navbar/mensaje_page2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fitmodeco_navbar/HomePage.dart';
import 'package:fitmodeco_navbar/Rutinas.dart';
import 'package:fitmodeco_navbar/ToDo.dart';

//Prueba de recetas.
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/login_admin/root_page.dart';
//

import 'package:fitmodeco_navbar/src/providers/push_notifications_providers.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //Esto es para las push notifications.
  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((data) {
      //para pruebas de notifications.
//      print('=====Argumento del Push=====');
//      print(data);
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new mensaje_page(data)));
    });
    //Prueba para en onLaunch no se quede la pantalla negra el recibir un mensaje.
    pushProvider.mensajes2.listen((data) {
      //para pruebas de notifications.
//      print('=====Argumento del Push222=====');
//      print(data);
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new mensaje_page2(data)));
    });
  }

  int _currentIndex = 0;

  // Lista de las paginas empezando en index 0 que es llamado a body.
  final _tab = [
    HomePage(),
    Rutinas(),
    //ToDo(),
    RootPage(
      auth: Auth(),
    )
  ];

  //Llamado al hacer tap sobre el menu inferior.
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _tab[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        //Condicional para el tamaña de la barra inferior por sistema operativo.
        height: Theme.of(context).platform == TargetPlatform.iOS ? 70 : 50,
        onTap: onTappedBar,
        index: _currentIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.black87),
          Icon(
            FontAwesomeIcons.dumbbell,
            size: 25,
            color: Colors.black87,
          ),
          //Icon(FontAwesomeIcons.listUl, size: 25, color: Colors.black87),
          Icon(FontAwesomeIcons.utensils, size: 30, color: Colors.black),
        ],
        color: Colors.redAccent,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
