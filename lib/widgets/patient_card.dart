import 'package:flutter/material.dart';

import 'package:par_mobile/helpers/global_helper.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/screens/alert_screen.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/patient_service.dart';
import 'package:par_mobile/widgets/patient_card_field.dart';
import 'package:provider/provider.dart';

class PatientCard extends StatelessWidget {
  /* final int id;
  final String numArquivoLiga;
  final String name;
  final String age;
  final String sex; */
  final Patient patient;
  final bool buttonsVisibility;
  final bool labelVisibility;

  const PatientCard(
      {Key key,
      @required this.patient,
      this.buttonsVisibility,
      this.labelVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: Container(
        height: 170.0,
        child: Stack(
          children: <Widget>[
            Visibility(
              visible: this.labelVisibility == true,
              child: Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      border: Border.all(style: BorderStyle.none),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                  height: double.infinity,
                  width: 6.0,
                ),
              ),
            ),
            Visibility(
              visible: this.buttonsVisibility == true,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.list),
                          onPressed: () {
                            var service = Provider.of<PatientService>(context,
                                listen: false);
                            service.showFilterDialog(context, this.patient.id);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.announcement),
                          onPressed: () {
                            pushToAlertScreen(
                                context, this.patient.getNumArquivoLiga);
                          },
                        ),
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 14.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            this.patient.getNumArquivoLiga != null
                                ? this.patient.getNumArquivoLiga
                                : '--',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(width: 2.0),
                          Text('-',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor)),
                          SizedBox(width: 2.0),
                          Flexible(
                            child: Text(
                              this.patient.name != null
                                  ? GlobalHelper().formatPatientNameField(
                                      this.patient.name.toUpperCase(),
                                    )
                                  : '--',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.0),
                      PatientCardField(
                        field: 'Data de internação:',
                        content: GlobalHelper()
                            .formatDate(this.patient.getCreationDate),
                      ),
                    ]),
              ),
            ),
            Positioned(
              bottom: 58.0,
              left: 16.0,
              child: PatientCardField(
                  field: 'Idade:',
                  content:
                      this.patient.getAge != null && this.patient.getAge != ''
                          ? GlobalHelper().formatPatientAge(this.patient.getAge)
                          : '--'),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: PatientCardField(
                  field: 'Sexo:', content: this.patient.getSex),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 10.0, left: 16.0),
            //     child: Text(
            //       this.patient.age == null
            //           ? 'Idade: ' + this.patient.age
            //           : 'Idade: --',
            //       style: TextStyle(
            //           color: Theme.of(context).primaryColor, fontSize: 15),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void pushToAlertScreen(BuildContext context, String numArquivoLiga) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AlertScreen(numArquivoLiga: numArquivoLiga)));
  }
}
