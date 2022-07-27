import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier{

  ClientProvider(){

  }

  CollectionReference<Map<String,dynamic>> collection(){
    return FirebaseFirestore.instance.collection('client');
  }

  Future<QuerySnapshot<Map<String, dynamic>>> registeredStream(String uid) {
    return collection().where('uid',isEqualTo: uid).get();
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> clientsStream(){
    return collection().snapshots();
  }

}