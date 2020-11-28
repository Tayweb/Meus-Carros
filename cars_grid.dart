
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colecao_de_carros/service/firebase_firestore_service.dart';
import 'package:colecao_de_carros/models/cars.dart';

class ListViewNote extends StatefulWidget {
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

class _ListViewNoteState extends State<ListViewNote> {
  List<Carros> items;
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  StreamSubscription<QuerySnapshot> noteSub;

  @override
  void initState() {
    super.initState();

    items = new List();

    noteSub?.cancel();
    noteSub = db.getCarrosList().listen((QuerySnapshot snapshot) {
      final List<Carros> notes = snapshot.documents
          .map((documentSnapshot) => Carros.fromMap(documentSnapshot.data()))
          .toList();

      setState(()
      {
        this.items = "V" as List<Carros>;
      });
    });
  }

  @override
  void dispose() {
    noteSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'grokonez Firestore Demo',
        home: Scaffold(
        appBar: AppBar(
        title: Text('grokonez Firestore Demo'),
    centerTitle: true,
    backgroundColor: Colors.blue,
    ),
    body: Center(
    child: ListView.builder(
    itemCount: items.length,
    padding: const EdgeInsets.all(15.0),
    itemBuilder: (context, position) {
    return Column(
    children: <Widget>[
    Divider(height: 5.0),
    ListTile(
    title: Text(
    '${items[position].modelo}',
    style: TextStyle(
    fontSize: 22.0,
    color: Colors.deepOrangeAccent,
    ),
    ),
    subtitle: Text(
    '${items[position].anomodelo}',
    style: new TextStyle(
    fontSize: 18.0,
    fontStyle: FontStyle.italic,
    ),
    ),
    leading: Column(
    children: <Widget>[
    Padding(padding: EdgeInsets.all(10.0)),
    CircleAvatar(
    backgroundColor: Colors.blueAccent,
    radius: 15.0,
    child: Text(
    '${position + 1}',
    style: TextStyle(
    fontSize: 22.0,
    color: Colors.white,
    ),
    ),
    ),
      //gridDelegate:
     // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),

      ],
    ),
    ),
      ],
    );

    },
    ),
    ),
    ),
    );
  }
  }


