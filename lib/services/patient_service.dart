import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/widgets/filter_modal.dart';

part 'patient_service.g.dart';

class PatientService = PatientServiceBase with _$PatientService;

abstract class PatientServiceBase with Store {
  List<Patient> patients = [];

  @observable
  DateTime initialDate;

  @observable
  DateTime finalDate;

  @observable
  String selectedField;

  @observable
  bool statusInitialDate;

  @observable
  bool statusFinalDate;

  @observable
  bool statusField;

  @computed
  DateTime get getInitialDate => initialDate;

  @computed
  DateTime get getFinalDate => finalDate;

  @computed
  String get getSelectedField => selectedField;

  @computed
  bool get buttonAvailable =>
      selectedField != null && initialDate != null && finalDate != null;

  @action
  setInitialDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((date) {
      initialDate = date;
    });
  }

  @action
  setFinalDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((date) {
      finalDate = date;
    });
  }

  showFilterDialog(BuildContext context, int idPatient) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FilterModal(
            idPatient: idPatient,
          );
        });
  }

  @action
  setSelectedField(String item) {
    selectedField = item;
  }

  @action
  setStatusInitialDateSelected(bool value) {
    statusInitialDate = value;
  }

  @action
  setStatusFinalDateSelected(bool value) {
    statusFinalDate = value;
  }

  @action
  setStatusFieldSelected(bool value) {
    statusField = value;
  }

  Patient findPatientByNumArquivoLiga(String numArquivoLiga) {
    for (var patient in patients) {
      if (patient.numArquivoLiga == numArquivoLiga) return patient;
    }
  }

  Patient findPatientById(int idPatient) {
    for (var patient in patients) {
      if (patient.id == idPatient) {
        return patient;
      }
    }
  }

  /* Patient findPatient(String numArquivoLiga) {
    Patient currentPatient;
    for (Patient patient in dummyPatients) {
      if (patientId == patient.id) currentPatient = patient;
    }
    return currentPatient;
  } */
}
