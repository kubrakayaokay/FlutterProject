import 'package:flutter/material.dart';
import 'package:flutter_kubra/data/DbHelper.dart';
import 'package:flutter_kubra/models/notes.dart';


class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  // ignore: deprecated_member_use
  List<Notes> allNotes = List<Notes>();
  var _controllerTitle = TextEditingController();
  var _controllerDesc = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  int clickedNoteID;

  void getNotes() async {
    var notesFuture = _databaseHelper.getAllNotes();
    await notesFuture.then((data) {
      setState(() {
        this.allNotes = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NOTLARIM"),
          backgroundColor:Colors.orange ,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    buildForm(_controllerTitle, "Başlık"),
                    buildForm(_controllerDesc, "Açıklama")
                  ])),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
              icon:Icon( Icons.add),
               color: Colors.lightGreen,
               highlightColor: Colors.deepOrangeAccent,
               onPressed: (){
                saveObject();
                        }
               ),
                    IconButton(
                       iconSize: 50,
                        icon:Icon( Icons.update),
                        color: Colors.deepOrangeAccent,
                        highlightColor: Colors.lightGreen,
                        onPressed: (){
                          updateObject();
                        }
                    ),



                  ]),
              Expanded(
                  child: ListView.builder(
                      itemCount: allNotes.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                                onTap: () {
                                  setState(() {
                                    _controllerTitle.text = allNotes[index].title;
                                    _controllerDesc.text =
                                        allNotes[index].description;
                                    clickedNoteID = allNotes[index].id;
                                  });
                                },
                                title: Text(allNotes[index].title),
                                subtitle: Text(allNotes[index].description),
                                trailing: GestureDetector(
                                  onTap: () {
                                    _deleteNote(allNotes[index].id, index);
                                  },
                                  child: Icon(Icons.delete ),
                                )));}))])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
            InputDecoration(labelText: str, border: OutlineInputBorder())));
  }


  void updateObject() {
    if (clickedNoteID != null) {
      if (_formKey.currentState.validate()) {
        _uptadeNote(Notes.withId(
            clickedNoteID, _controllerTitle.text, _controllerDesc.text));
      }
    } else {
      alert();
    }
  }

  void saveObject() {
    if (_formKey.currentState.validate()) {
      _addNote(Notes(_controllerTitle.text, _controllerDesc.text));
    }
  }

  void alert() {
    AlertDialog alert = AlertDialog(
      title: Text("SEÇİLİ NOT YOK!"),
      content: Text("Lütfen bir not seçerek güncelleme işlemi yapınız!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _addNote(Notes note) async {
    await _databaseHelper.insert(note);

    setState(() {
      getNotes();
      _controllerTitle.text = "";
      _controllerDesc.text = "";
    });
  }

  void _uptadeNote(Notes note) async {
    await _databaseHelper.update(note);

    setState(() {
      getNotes();
      _controllerTitle.text = "";
      _controllerDesc.text = "";
      clickedNoteID = null;
    });
  }

  void _deleteNote(int deletedNoteId, int deletedNoteIndex) async {
    await _databaseHelper.delete(deletedNoteId);

    setState(() {
      getNotes();
    });
  }
}


