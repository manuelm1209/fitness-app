import 'package:fitmodeco_navbar/login_admin/root_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitmodeco_navbar/auth/auth.dart';
import 'package:fitmodeco_navbar/login_admin/contentPage.dart';
import 'package:fitmodeco_navbar/widgets/home_pageR.dart';
import 'package:fitmodeco_navbar/screens/menu_semanal.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
//Spoon
import 'package:fitmodeco_navbar/screens/search_screen_spoon.dart';
import 'package:fitmodeco_navbar/screens/dietas_screen_spoon.dart';

const PrimaryColor = const Color(0xFF19212B);

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String usuario = 'Usuario'; //user
  String usuarioEmail = 'Email'; //userEmail
  String id;

  Content page = ContentPage();

  Widget contentPage = HomePageRecipes(); //Pagina principal recetas

  void _signOut() async {
    try {
      widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.auth.infoUser().then((onValue) {
      setState(() {
        usuario = onValue.displayName;
        usuarioEmail = onValue.email;
        id = onValue.uid;
        //print('ID $id');
      });
    });
  }

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

  final String image = "assets/images/logo_solo.png";
  final String logoBar = "assets/images/logo_completo_blanco.png";
  final String imageCircular = "assets/images/logo_solo_circular.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          elevation: 30.0,
          child: Container(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey.shade50),
                  currentAccountPicture: CircleAvatar(
                    maxRadius: 10.0,
                    backgroundImage: AssetImage(image),
                  ),
                  accountName: Text(
                    '$usuario',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  accountEmail: Text(
                    '$usuarioEmail',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
// imagen que aparece en el menu lateral al lado de la imagen avatar.
//                  decoration: BoxDecoration(
//                      color: Color(0xFF262F3D),
//                      image: DecorationImage(
//                        alignment: Alignment(1.0, 0),
//                        image: AssetImage(
//                          'assets/images/misanplas.jpg',
//                        ),
//                        fit: BoxFit.scaleDown, //BoxFit.fitHeight
//                      )),
                ),
                Divider(
                  height: 2.0,
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    page.lista().then((value) {
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  trailing: Icon(
                    FontAwesomeIcons.home,
                  ),
                  title: Text(
                    'Inicio',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new DietaScreen()));
                  },
                  trailing: Icon(
                    FontAwesomeIcons.listUl,
                  ),
                  title: Text(
                    'Tipos de dieta',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new SearchScreen()));
                  },
                  trailing: Icon(
                    FontAwesomeIcons.book,
                  ),
                  title: Text(
                    '380.000 Recetas',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    page.myrecipe(id).then((value) {
                      //print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  trailing: Icon(
                    FontAwesomeIcons.eyeSlash,
                  ),
                  title: Text(
                    'Recetas Privadas',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    page.admin().then((value) {
                      //print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  trailing: Icon(
                    FontAwesomeIcons.globeAmericas,
                  ),
                  title: Text(
                    'Recetas Publicas',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ListTile(
                  title: Text("Menú Semanal", style: TextStyle(fontSize: 18.0)),
                  trailing: Icon(FontAwesomeIcons.calendarAlt),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new MenuSemanal()));
                  },
                ),
                new Divider(),
                ListTile(
                  title: Text("Más información:",
                      style: TextStyle(fontSize: 20.0)),
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
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          trailing: Icon(
                            FontAwesomeIcons.medal,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            _launchInBrowser(
                                "https://www.thefitmode.com/planes/");
                          },
                        ),
                      ),
                ListTile(
                  title: Text("Cerrar", style: TextStyle(fontSize: 18.0)),
                  trailing: Icon(FontAwesomeIcons.times),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  trailing: Icon(
                    Icons.exit_to_app,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _signOut();
                  },
                ),
                new Divider(),
              ],
            ),
          )),
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
//iconos botones en la appbar.
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.grid_on),
//            tooltip: 'Grid',
//            onPressed: () {
//              Route route = MaterialPageRoute(builder: (context) => GridPageInicio());
//              Navigator.push(context, route);
//            },
//          ),
//        ],
      ),
      body: contentPage,
    );
  }
}
