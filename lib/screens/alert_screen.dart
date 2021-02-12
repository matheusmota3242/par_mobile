import 'package:flutter/material.dart';

import 'package:par_mobile/models/alert_model.dart';
import 'package:par_mobile/models/api_response_model.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/patient_service.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:par_mobile/widgets/empty_list_widget.dart';
import 'package:par_mobile/widgets/error_container.dart';
import 'package:provider/provider.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/widgets/alert_item.dart';
import 'package:par_mobile/widgets/appbar.dart';
import 'package:par_mobile/widgets/patient_card.dart';

class AlertScreen extends StatefulWidget {
  final String numArquivoLiga;
  final bool labelVisibility;
  const AlertScreen({Key key, this.numArquivoLiga, this.labelVisibility})
      : super(key: key);
  @override
  _AlertScreen createState() => _AlertScreen();
}

class _AlertScreen extends State<AlertScreen> {
  ApiService _apiService = ApiService();
  ApiResponse<List<Alert>> _apiResponse;
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
    _apiResponse = await _apiService.getAlertsByPatient(
        widget.numArquivoLiga, GlobalVar().jwt);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _service = Provider.of<PatientService>(context, listen: false);

    Patient patient =
        _service.findPatientByNumArquivoLiga(widget.numArquivoLiga);
    return Scaffold(
        appBar: MyAppBar(title: 'ALERTAS'),
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
          if (_apiResponse.isError) return ErrorContainer();
          return ListView(children: <Widget>[
            PatientCard(
              patient: patient,
              buttonsVisibility: false,
            ),
            _apiResponse.data.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: EmptyList(),
                  )
                : Card(
                    elevation: 7,
                    margin: EdgeInsets.fromLTRB(16.0, 16, 16, 0),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AlertItem(
                          alert: _apiResponse.data[index],
                        );
                      },
                      itemCount: _apiResponse.data.length,
                    ),
                  ),
          ]);
        }));
  }
}
