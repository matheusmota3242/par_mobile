import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:par_mobile/screens/vital_signs_screen.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/patient_service.dart';

class FilterModal extends StatelessWidget {
  final int idPatient;

  const FilterModal({Key key, this.idPatient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PatientService>(context, listen: false);

    Widget selectVisualizeButton() {
      if (controller.buttonAvailable) {
        return RaisedButton(
          onPressed: () {
            pushToAlertScreen(context, controller.getSelectedField,
                controller.getInitialDate, controller.getFinalDate);
            controller.initialDate = null;
            controller.finalDate = null;
            controller.selectedField = null;
          },
          child: Text(
            'Visualizar',
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).primaryColorLight,
        );
      } else {
        return AbsorbPointer(
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              'Visualizar',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.grey,
          ),
        );
      }
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height / 2.5,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.95),
              child: Text(
                'Selecione os parâmetros para visualizar os sinais vitais...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Align(
                alignment: Alignment(0, -0.4),
                child: Observer(
                  builder: (_) {
                    return DropdownButton<String>(
                      hint: Text(
                        'Campo',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      items: <String>[
                        'HR',
                        'NBPd',
                        'NBPm',
                        'NBPs',
                        'Perf',
                        'PVC',
                        'Pulse',
                        'Resp',
                        'ST-II',
                        'SpO2',
                        'TA'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.setSelectedField(value);
                        controller.setStatusFieldSelected(true);
                      },
                      value: controller.getSelectedField,
                    );
                  },
                )),
            Align(
              alignment: Alignment(-0.8, 0.1),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return Text(
                          controller.getInitialDate == null
                              ? 'Data inicial'
                              : '${controller.getInitialDate.day}/${controller.getInitialDate.month}/${controller.getInitialDate.year}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () => controller.setInitialDate(context),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.1),
              child: Text('|',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
            ),
            Align(
              alignment: Alignment(0.95, 0.1),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return Text(
                          controller.getFinalDate == null
                              ? 'Data final'
                              : '${controller.getFinalDate.day}/${controller.getFinalDate.month}/${controller.getFinalDate.year}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () => controller.setFinalDate(context),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Observer(
                builder: (_) {
                  return selectVisualizeButton();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushToAlertScreen(BuildContext context, String field,
      DateTime dataInicio, DateTime dataFim) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VitalSignsScreen(
          idPatient: idPatient,
          field: field,
          dataInicio: dataInicio,
          dataFim: dataFim,
        ),
      ),
    );
  }
}
