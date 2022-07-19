import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkerProvider extends ChangeNotifier{

 String name='Robert';

 WorkerProvider(){

  }

 CollectionReference<Map<String,dynamic>> collection(){
  return FirebaseFirestore.instance.collection('worker');
 }


 Future<QuerySnapshot<Map<String, dynamic>>> registeredStream(String uid) {
  return collection().where('uid',isEqualTo: uid).get();
 }

}