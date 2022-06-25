import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier{

  ClientProvider(){

  }

  CollectionReference<Map<String,dynamic>> collection(){
    return FirebaseFirestore.instance.collection('client');
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> shopsStream(){
    return collection().snapshots();
  }

}