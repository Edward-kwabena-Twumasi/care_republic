import 'package:thecut/models/job_model.dart';

class Notification{
  late String _uid;
  late String _type;
  late DateTime _readTime;
  late bool _readStatus;
  late Map<String,dynamic>? _appointment;
  late String? _body;
  late Job? _job;

  Notification(this._uid, this._type, this._readTime, this._readStatus,
      this._appointment, this._body, this._job);

  String? get body => _body;

  Map<String, dynamic>? get appointment => _appointment;

  bool get readStatus => _readStatus;


  Job? get job => _job;

  set uid(String value) {
    _uid = value;
  }

  DateTime get readTime => _readTime;

  String get type => _type;

  String get uid => _uid;

  Notification.fromJson(Map<String,dynamic> notificationMap ){
    uid=notificationMap['uid']??"undefined";
    type=notificationMap['type']??"GENERAL";
    readTime=notificationMap['read_time']??DateTime.now();
    readStatus=notificationMap['read_status']??false;
    appointment=notificationMap['appointment'];
    body=notificationMap['body'];
    job=Job.fromJson(notificationMap['job']);
  }

  set type(String value) {
    _type = value;
  }

  set readTime(DateTime value) {
    _readTime = value;
  }

  set job(Job? value) {
    _job = value;
  }

  set body(String? value) {
    _body = value;
  }

  set appointment(Map<String, dynamic>? value) {
    _appointment = value;
  }

  set readStatus(bool value) {
    _readStatus = value;
  }
}