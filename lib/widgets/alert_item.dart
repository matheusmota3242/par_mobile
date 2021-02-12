import 'package:flutter/material.dart';
import 'package:par_mobile/models/alert_model.dart';

class AlertItem extends StatelessWidget {
  final int patientId;
  final Alert alert;

  const AlertItem({Key key, this.patientId, this.alert}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double middleTopPadding = 24;
    final double lastTopPadding = 44;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 82.0,
      padding: EdgeInsets.all(12.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Text(
              '${alert.field.toUpperCase()}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: middleTopPadding,
            child: Text(
              'Data e hora',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: middleTopPadding,
            right: MediaQuery.of(context).size.width / 3.5 - 2,
            child: Text(
              'Valor',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            child: Text(
              '${alert.dateTime.day.toString().padLeft(2, '0')}/${alert.dateTime.month.toString().padLeft(2, '0')}/${alert.dateTime.year.toString()} ${alert.dateTime.hour.toString().padLeft(2, '0')}:${alert.dateTime.minute.toString().padLeft(2, '0')}:${alert.dateTime.second.toString().padLeft(2, '0')}',
            ), 
            //child: Text(alert.dateTime),
            top: lastTopPadding,
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              alert.value.toString(),
            ),
            top: lastTopPadding,
          ),
          Positioned(
            right: 0,
            top: 32,
            child: alert.alertType == 'abaixo'
                ? Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.arrow_upward,
                    color: Color(0xFF851826),
                  ),
          )
        ],
      ),
    );
  }
}
