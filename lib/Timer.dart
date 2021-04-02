//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/Timer2.dart';
import 'package:fitmodeco_navbar/HomePage.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomePage2(),
        routes: <String, WidgetBuilder>{
          "/30s": (BuildContext context) => new Timer2(30),
          "/1m": (BuildContext context) => new Timer2(60),
          "/3m": (BuildContext context) => new Timer2(180),
          "/5m": (BuildContext context) => new Timer2(300),
          "/7m": (BuildContext context) => new Timer2(420),
          "/10m": (BuildContext context) => new Timer2(600),
          "/15m": (BuildContext context) => new Timer2(900),
          "/20m": (BuildContext context) => new Timer2(1200),
          "/30m": (BuildContext context) => new Timer2(1800),
          "/40m": (BuildContext context) => new Timer2(2400),
          "/45m": (BuildContext context) => new Timer2(2700),
          "/50m": (BuildContext context) => new Timer2(3000),
          "/60m": (BuildContext context) => new Timer2(3600),
        });
  }
}

class HomePage2 extends StatelessWidget {
  final String logoBar = "assets/images/logo_completo_blanco.png";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        body: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: ListView(
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                        "00:30",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/30s"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "01:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/1m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "03:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/3m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "05:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/5m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "07:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/7m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "10:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/10m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "15:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/15m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "20:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/20m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "30:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/30m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "40:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/40m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "45:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/45m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "50:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/50m"),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "60:00",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.of(context).pushNamed("/60m"),
                    ),
                    new Divider(),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
