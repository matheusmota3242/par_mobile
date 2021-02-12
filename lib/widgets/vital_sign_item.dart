import 'package:flutter/material.dart';
import 'package:par_mobile/models/vital_sign_model.dart';

class VitalSignItem extends StatelessWidget {
  final VitalSign vitalSign;

  const VitalSignItem({Key key, this.vitalSign}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 36.0,
      padding: EdgeInsets.only(bottom: 10.0, left: 12, right: 12),
      child: Stack(
        /* mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max, */
        children: <Widget>[
          Positioned(
            child: Text(
              '${vitalSign.dateTime.day.toString().padLeft(2, '0')}/${vitalSign.dateTime.month.toString().padLeft(2, '0')}/${vitalSign.dateTime.year.toString()} ${vitalSign.dateTime.hour.toString().padLeft(2, '0')}:${vitalSign.dateTime.minute.toString().padLeft(2, '0')}:${vitalSign.dateTime.second.toString().padLeft(2, '0')}',
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              vitalSign.value.toString(),
            ),
          ),
          Positioned(
            right: 0,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
