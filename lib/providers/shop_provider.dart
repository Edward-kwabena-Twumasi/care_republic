import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopProvider extends ChangeNotifier{

  Map<String,dynamic> tempShopDetails={
    "uid": "",
    "_ids": [],
    "fname": "undefined",
    "sname": "undefined",
    "dob": DateTime.now(),
    "owner_contact": "undefined",
    "sex": "undefined",
    "shop_name": "undefined",
    "land_mark": "undefined",
    "email": "undefined",
    "ig_handle": "undefined",
    "phone": "undefined",
    "photo_url": "",
    "types": [],
    "tags": [],
    "location": const GeoPoint(0, 0),
    "desc": ""
  };

  ShopProvider();

CollectionReference<Map<String,dynamic>> collection(){
    return FirebaseFirestore.instance.collection('shop');
  }


  Future<QuerySnapshot<Map<String, dynamic>>> registeredStream(String uid) {
    return collection().where('uid',isEqualTo: uid).get();
  }


  Stream<QuerySnapshot<Map<String,dynamic>>> shopsStream(){
    return collection().snapshots();
  }


  setTemporaryShopDetails(Map<String,dynamic> incomingShop){
    tempShopDetails=incomingShop;
    incomingShop.keys.forEach((key) {
      tempShopDetails[key]=incomingShop[key];
    });
    notifyListeners();
  }



}