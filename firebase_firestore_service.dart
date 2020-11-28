import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colecao_de_carros/models/cars.dart';

final CollectionReference noteCollection = Firestore.instance.collection('carros');

class FirebaseFirestoreService {

  static final FirebaseFirestoreService _instance = new FirebaseFirestoreService.internal();

  factory FirebaseFirestoreService() => _instance;

  FirebaseFirestoreService.internal();

  Future<Carros> createCarros(String modelo, String anomodelo,String marca,String anofabricacao,String placa) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document());

      final Carros carros = new Carros( modelo, anomodelo, marca, anofabricacao,placa);
      final Map<String, dynamic> data = carros.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Carros.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getCarrosList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = noteCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<dynamic> updateCarros(Carros carros) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document(carros.id));

      await tx.update(ds.reference, carros.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteNote(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }
}
