import 'package:flutter/material.dart';

class PatientCardField extends StatelessWidget {
  final String field;
  final String content;
  static const double fontSize = 15.0;
  const PatientCardField(
      {Key key, @required this.field, @required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            field,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 6.0,
          ),
          Text(
            content != null && content != '' ? content : '--',
            style: TextStyle(fontSize: fontSize),
          )
        ],
      ),
    );
  }
}
