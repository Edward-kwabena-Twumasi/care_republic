import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class JobProvider extends ChangeNotifier {


  JobProvider() {

  }

  CollectionReference<Map<String, dynamic>> collection() {
    return FirebaseFirestore.instance.collection('job');
  }

}