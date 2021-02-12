import 'package:par_mobile/models/vital_sign_model.dart';

class Alert {
  int id;
  DateTime dateTime;
  String field;
  double value;
  String alertType;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getField => field;

  set setField(String field) => this.field = field;

  double get getValue => value;

  set setValue(double value) => this.value = value;

  String get getAlertType => alertType;

  set setAlertType(String alertType) => this.alertType = alertType;

  Alert(this.id, this.dateTime, this.field, this.value, this.alertType);
}
