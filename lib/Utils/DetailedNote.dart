import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/Utils/Notes.dart';

class DetailedNote extends StatefulWidget {
  Note selectedNote;

  DetailedNote(this.selectedNote);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailedNoteState(selectedNote);
  }
}

class DetailedNoteState extends State<DetailedNote> {
  Note selectedNote;

  DetailedNoteState(this.selectedNote);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNote.getTitle),
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context, selectedNote.getReadState);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                selectedNote.getNoteContent,
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
