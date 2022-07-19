import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Shop{
  late String _uid;
  late List _ids;
  late String _desc;
  late DateTime _dob;
  late String _email;
  late String _fName;
  late String _sName;
  late String? _iGHandle;
  late String _photoUrl;
  late String _sex;
  late List _tags;
  late List _types;
  late GeoPoint _location;
  late String _shopName;
  late String _phone;
  late Map<String,dynamic> _shopDetails;

  Shop(
      this._uid,
      this._ids,
      this._desc,
      this._dob,
      this._email,
      this._fName,
      this._sName,
      this._iGHandle,
      this._photoUrl,
      this._sex,
      this._tags,
      this._types,
      this._location,
      this._shopName,
      this._phone,
      this._shopDetails);

  Shop.fromJson(Map<String,dynamic> shopMap){
    uid=shopMap['uid']??"undefined";
    ids=shopMap['_ids']??[];
    desc=shopMap['desc']??"undefined";
    dob=shopMap['dob']??DateTime.fromMillisecondsSinceEpoch(0);
    email=shopMap['email']??"undefined";
    fName=shopMap['fname']??"undefined";
    sName=shopMap['sname']??"undefined";
    iGHandle=shopMap['ig_handle']??"undefined";
    photoUrl=shopMap['photo_url']??"undefined";
    sex=shopMap['sex']??"undefined";
    tags=shopMap['tags']??[];
    types=shopMap['types']??[];
    location=shopMap['location']??"undefined";
    shopName=shopMap['shop_name']??"undefined";
    phone=shopMap['phone']??"undefined";
    shopDetails=shopMap;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  Map<String, dynamic> get shopDetails => _shopDetails;

  set shopDetails(Map<String, dynamic> value) {
    _shopDetails = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  List get ids => _ids;

  set ids(List value) {
    _ids = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  GeoPoint get location => _location;

  set location(GeoPoint value) {
    _location = value;
  }

  String get shopName => _shopName;

  set shopName(String value) {
    _shopName = value;
  }

  DateTime get dob => _dob;

  set dob(DateTime value) {
    _dob = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get fName => _fName;

  set fName(String value) {
    _fName = value;
  }

  String get sname => _sName;

  set sName(String value) {
    _sName = value;
  }

  String? get iGHandle => _iGHandle;

  set iGHandle(String? value) {
    _iGHandle = value;
  }

  String get photoUrl => _photoUrl;

  set photoUrl(String value) {
    _photoUrl = value;
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  List get tags => _tags;

  set tags(List value) {
    _tags = value;
  }

  List get types => _types;

  set types(List value) {
    _types = value;
  }
}