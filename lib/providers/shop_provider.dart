import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier{


  ShopProvider(){

  }

CollectionReference<Map<String,dynamic>> collection(){
    return FirebaseFirestore.instance.collection('shop');
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> shopsStream(){
    return collection().snapshots();
  }

}