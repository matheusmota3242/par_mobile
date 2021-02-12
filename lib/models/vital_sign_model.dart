class VitalSign {
  int id;
  DateTime dateTime;
  double value;

  int get getId => id;
  set setId(int id) => this.id = id;

  double get getValue => value;
  set setValue(double value) => this.value = value;

  VitalSign(this.id, this.dateTime, this.value);
}
