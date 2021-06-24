
import 'package:flutter/material.dart';
import 'package:flutter_kubra/screens/HesapMakinesi.dart';
import 'package:flutter_kubra/screens/NotesList.dart';
import 'package:flutter_kubra/screens/VucutKitleInddexi.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uygulama Çantası',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('UYGULAMA ÇANTASI'),
        ),
        body: Center(

          child: Text(
            " ⭐HOŞGELDİNİZ⭐ ",
            style:TextStyle(color: Colors.indigo, fontSize: 40),
          ),
        ));
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'UYGULAMALAR',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.black38,
               ),
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Hesap Makinesi'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HesapMakinesi()))},
          ),
          ListTile(
            leading: Icon(Icons.note_add),
            title: Text('Notes'),
            onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotePage ()))},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Vücut Kitle İndexi'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>VucutKitleIndeksi()))},
          ),

        ],
      ),
    );
  }
}



