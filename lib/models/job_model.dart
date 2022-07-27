class Job {
  late String _uid;
  late String _title;
  late bool _isVacant;
  late String _workerType;
  late String _description;
  late DateTime _date;

  Job(this._uid, this._title,this._isVacant, this._workerType, this._description, this._date);

  DateTime get date => _date;

  String get description => _description;

  String get workerType => _workerType;

  bool get isVacant => _isVacant;

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  Job.fromJson(Map<String,dynamic> jobMap) {
      uid=jobMap['uid'];
      isVacant=jobMap['is_vacant'];
      workerType=jobMap['worker_type'];
      description=jobMap['description'];
      date=jobMap['date'];
      title=jobMap['title'];
  }

  set title(String value) {
    _title = value;
  }

  String get title => _title;

  set isVacant(bool value) {
    _isVacant = value;
  }

  set date(DateTime value) {
    _date = value;
  }

  set description(String value) {
    _description = value;
  }

  set workerType(String value) {
    _workerType = value;
  }
}
