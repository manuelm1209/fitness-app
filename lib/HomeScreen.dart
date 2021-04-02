import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/Utils/Notes.dart';
import 'package:fitmodeco_navbar/Utils/DetailedNote.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final String logoBar = "assets/images/logo_completo_blanco.png";
  List<Note> _notes;

  HomeScreenState() {
    _notes = Notes.initializeNotes().getNotes;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0))),
              child: ListTile(
                title: Text(
                  _notes[index].getTitle,
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedNote(_notes[index])));
                },
              ),
            );
          }),
    );
  }
}
