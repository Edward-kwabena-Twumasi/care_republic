import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thecut/generator/util.dart';


enum NetworkStatus { wifi, mobile, offline }


class AppProvider extends ChangeNotifier {

  AppProvider(){
    getCurrentLocation();
  }

  String? activePhone;

  Position currentPosition = toPosition(LatLng(0,0));

  Map<String, dynamic> userDetails = {
    "uid": "newuser111",
    "fname": "Robert ",
    'lname': "Doe",
    "email": "newuser@email.com",
    "favorites": [
      {"photo_url": ""}
    ]
  };


  CollectionReference<Map<String, dynamic>> collection() {
    return FirebaseFirestore.instance.collection('registry');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> registryStream() {
    return collection().snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> registeredUsers(String phone) {
    //return collection().where('phone',isEqualTo: phone).snapshots();
    return collection().where('phone', isEqualTo: phone).get();
  }


  void setActivePhone(String phone) {
    activePhone = phone;
    notifyListeners();
  }


  getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;
    notifyListeners();
  }


}
