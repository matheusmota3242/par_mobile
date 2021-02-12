import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:par_mobile/models/api_response_model.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/models/vital_sign_model.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/patient_service.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:par_mobile/widgets/appbar.dart';
import 'package:par_mobile/widgets/empty_list_widget.dart';
import 'package:par_mobile/widgets/patient_card.dart';
import 'package:par_mobile/dummy_data.dart';
import 'package:par_mobile/widgets/vital_sign_item.dart';

class VitalSignsScreen extends StatefulWidget {
  final int idPatient;
  final String field;
  final DateTime dataInicio;
  final DateTime dataFim;

  const VitalSignsScreen({
    Key key,
    this.idPatient,
    this.field,
    this.dataInicio,
    this.dataFim,
  }) : super(key: key);
  @override
  _VitalSignsScreen createState() => _VitalSignsScreen();
}

class _VitalSignsScreen extends State<VitalSignsScreen> {
  ApiService _apiService = ApiService();
  ApiResponse<List<VitalSign>> _apiResponse;
  bool isLoading = false;

  @override
  void initState() {
    _fetchAlerts();
    super.initState();
  }

  _fetchAlerts() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await _apiService.getVitalSignsByPatientOnInterval(
        widget.idPatient,
        widget.field,
        widget.dataInicio,
        widget.dataFim,
        GlobalVar().jwt);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PatientService>(context);
    Patient patient = _controller.findPatientById(widget.idPatient);

    return Scaffold(
        appBar: MyAppBar(
          title: 'SINAIS VITAIS',
        ),
        body: Builder(builder: (_) {
          if (isLoading) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      "Carregando...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          if (_apiResponse.isError)
            return ListView(children: <Widget>[
              PatientCard(
                patient: patient,
                buttonsVisibility: false,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: EmptyList(),
              )
            ]);
          return ListView(
            children: <Widget>[
              PatientCard(patient: patient),
              Card(
                elevation: 7,
                margin: EdgeInsets.fromLTRB(16.0, 16, 16, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.field.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                      padding: EdgeInsets.all(12.0),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Text(
                              'Data e hora',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width / 3.5 - 2,
                            child: Text(
                              'Valor',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        //padding: EdgeInsets.all(12.0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _apiResponse.data.length,
                        itemBuilder: (context, index) {
                          return VitalSignItem(
                            vitalSign: _apiResponse.data[index],
                          );
                        }),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
