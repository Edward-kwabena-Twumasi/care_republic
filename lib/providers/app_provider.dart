import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum NetworkStatus { wifi, mobile, offline }

class AppProvider extends ChangeNotifier {
  AppProvider();
  String? activePhone;


  CollectionReference<Map<String, dynamic>> collection() {
    return FirebaseFirestore.instance.collection('registry');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> registryStream() {
    return collection().snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> registeredStream(String phone) {
    return collection().where('phone',isEqualTo: phone).snapshots();
  }

  void setActivePhone(String phone){
    activePhone=phone;
    notifyListeners();
  }



}
