import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:par_mobile/helpers/global_helper.dart';

import 'package:par_mobile/models/alert_model.dart';
import 'package:par_mobile/models/api_response_model.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/models/vital_sign_model.dart';

part 'api_service.g.dart';

class ApiService = ApiServiceBase with _$ApiService;

abstract class ApiServiceBase with Store {
  static const API_URL = 'http://192.168.0.34:8080/par-api';
  //static const API_URL = 'http://localhost:8080/par-api';

  String _jwt = "";

  String get jwt => _jwt;

  set jwt(String value) => _jwt = jwt;

  // FETCHING DATA
  @observable
  bool isLoading = false;

  @computed
  bool get getIsLoading => isLoading;

  @action
  setIsLoading(bool isLoadingParam) => isLoading = isLoadingParam;

  bool _isLastPatientsPage = false;

  int _patientsPage = 0;

  List<Alert> alerts = [];

  List<VitalSign> vitalSigns = [];

  /// Autenticação passando username e password e recebendo o jwt.
  Future<ApiResponse> authenticate(String username, String password) async {
    ApiResponse apiResponse = ApiResponse();
    String url = API_URL + '/autenticacao';
    await http
        .post(url,
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            body:
                json.encode({"username": "$username", "password": "$password"}))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        apiResponse.data = jsonData['jwt'];
      } else {
        apiResponse.isError = true;
        apiResponse.errorMessage = "Ocorreu um erro.";
      }
    });
    return apiResponse;
  }

  /// Recebe lista com histórico de pacientes
  Future<ApiResponse<List<Patient>>> getPatients(
      String jwt, bool isFirstPage) async {
    ApiResponse<List<Patient>> apiResponse = ApiResponse<List<Patient>>();
    List<Patient> patients = [];
    if (!isFirstPage) {
      if (!_isLastPatientsPage) {
        ++_patientsPage;
      }
    } else {
      _isLastPatientsPage = false;
      _patientsPage = 0;
    }

    if (_isLastPatientsPage) {
      return ApiResponse<List<Patient>>(isError: false, data: []);
    }

    await http.get(API_URL + '/pacientes?page=$_patientsPage', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
    }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData['content']) {
          final patient = Patient(
              item['id'],
              item['numeroArquivoLiga'] != null
                  ? item['numeroArquivoLiga']
                  : '--',
              item['name'] != null ? item['name'] : '--',
              item['age'] != null ? item['age'] : '--',
              item['sex'] != null ? item['sex'] : '--',
              item['creationDate'] != null
                  ? GlobalHelper()
                      .convertTimestampToDateTime(item['creationDate'])
                  : null);

          patients.add(patient);
        }
        apiResponse.data = patients;
      } else {
        apiResponse.errorMessage =
            ' Desculpe, ocorreu um erro.\nTente novamente em breve.';
        apiResponse.isError = true;
      }
    }).catchError((error) {
      print(error);
      apiResponse.errorMessage =
          ' Desculpe, ocorreu um erro.\nTente novamente em breve.';
      apiResponse.isError = true;
    });
    return apiResponse;
  }

  Future<ApiResponse<List<Patient>>> getHospitalizedPatients(
      String jwt, bool isFirstPage) async {
    var patients = <Patient>[];
    ApiResponse<List<Patient>> apiResponse = ApiResponse<List<Patient>>();

    if (!isFirstPage) {
      if (!_isLastPatientsPage) {
        ++_patientsPage;
      }
    } else {
      _isLastPatientsPage = false;
      _patientsPage = 0;
    }

    if (_isLastPatientsPage) {
      return ApiResponse<List<Patient>>(isError: false, data: []);
    }

    await http.get(API_URL + '/pacientes-internados', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
    }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData['content']) {
          final patient = Patient(
              item['id'],
              item['numeroArquivoLiga'] != null
                  ? item['numeroArquivoLiga']
                  : '--',
              item['name'] != null ? item['name'] : '--',
              item['age'] != null ? item['age'] : '--',
              item['sex'] != null ? item['sex'] : '--',
              item['creationDate'] != null
                  ? DateTime.parse(item['creationDate'])
                  : null);

          patients.add(patient);
        }
        apiResponse.data = patients;
      } else {
        apiResponse.errorMessage =
            ' Desculpe, ocorreu um erro.\nTente novamente em breve.';
        apiResponse.isError = true;
      }
    }).catchError((error) {
      apiResponse.errorMessage =
          ' Desculpe, ocorreu um erro.\nTente novamente em breve.';
      apiResponse.isError = true;
    });
    return apiResponse;
  }

  /// RETORNA PACIENTE DE ACORDO COM N. ARQUIVO LIGA
  // Patient getPatient(String numArquivoLiga) {
  //   for (var patient in patients) {
  //     if (patient.numArquivoLiga == numArquivoLiga) return patient;
  //   }
  // }

  /// Recebe os alertas do paciente passando o numeroArquivoLiga.
  Future<ApiResponse<List<Alert>>> getAlertsByPatient(
      String numArquivoLiga, String jwt) async {
    ApiResponse<List<Alert>> apiResponse = ApiResponse<List<Alert>>();
    print('jwt: $jwt');
    await http.get(
        API_URL + '/alertas-por-paciente?numArquivoLiga=' + numArquivoLiga,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          final alert = Alert(
              item['id'],
              DateTime.parse(item['dateTime']),
              item['attributeName'],
              item['attributeValue'],
              item['alertDescription']);

          alerts.add(alert);
        }
        apiResponse.data = alerts;
      } else {
        apiResponse.isError = true;
        apiResponse.errorMessage = 'Desculpe, ocorreu um erro.';
      }
    }).catchError((onError) {
      apiResponse.isError = true;
      apiResponse.errorMessage = 'Desculpe, ocorreu um erro.';
    });
    return apiResponse;
  }

  Future<ApiResponse<List<VitalSign>>> getVitalSignsByPatientOnInterval(
      int idPatient,
      String name,
      DateTime dataInicio,
      DateTime dataFim,
      String jwt) async {
    ApiResponse<List<VitalSign>> apiResponse = ApiResponse<List<VitalSign>>();
    await http.get(
        API_URL +
            '/sinais-vitais?idPatient=' +
            idPatient.toString() +
            '&name=' +
            name +
            '&dataInicio=' +
            formatDate(dataInicio) +
            '&dataFim=' +
            formatDate(dataFim),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          final vitalSign = VitalSign(
              item['id'], DateTime.parse(item['date']), item['value']);
          vitalSigns.add(vitalSign);
        }
        apiResponse.data = vitalSigns;
      } else {
        apiResponse.isError = true;
        apiResponse.errorMessage = 'Desculpe, aconteuceu correu um erro.';
      }
    }).catchError((onError) {
      apiResponse.isError = true;
      apiResponse.errorMessage = 'Desculpe, ocorreu um erro';
    });
    return apiResponse;
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
