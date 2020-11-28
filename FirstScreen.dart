import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colecao_de_carros/screens/form_cars.dart';
import 'package:colecao_de_carros/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:colecao_de_carros/utils/utils.dart';
import 'package:colecao_de_carros/widgets/cars_grid.dart';

import 'models/cars.dart';

class FirstScreen extends StatelessWidget {
  List<Carros> items;
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  StreamSubscription<QuerySnapshot> noteSub;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Meus Carros', style: SubHeading),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add, size: 30, color: Colors.blue),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Form_cars()),
              );
            },
          )
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListViewNote(),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Taina Fontes'),
              accountEmail: Text('tainafontes506@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                child: new Text("T"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}