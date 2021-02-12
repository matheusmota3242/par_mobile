// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PatientService on PatientServiceBase, Store {
  Computed<DateTime> _$getInitialDateComputed;

  @override
  DateTime get getInitialDate => (_$getInitialDateComputed ??=
          Computed<DateTime>(() => super.getInitialDate))
      .value;
  Computed<DateTime> _$getFinalDateComputed;

  @override
  DateTime get getFinalDate =>
      (_$getFinalDateComputed ??= Computed<DateTime>(() => super.getFinalDate))
          .value;
  Computed<String> _$getSelectedFieldComputed;

  @override
  String get getSelectedField => (_$getSelectedFieldComputed ??=
          Computed<String>(() => super.getSelectedField))
      .value;
  Computed<bool> _$buttonAvailableComputed;

  @override
  bool get buttonAvailable => (_$buttonAvailableComputed ??=
          Computed<bool>(() => super.buttonAvailable))
      .value;

  final _$initialDateAtom = Atom(name: 'PatientServiceBase.initialDate');

  @override
  DateTime get initialDate {
    _$initialDateAtom.context.enforceReadPolicy(_$initialDateAtom);
    _$initialDateAtom.reportObserved();
    return super.initialDate;
  }

  @override
  set initialDate(DateTime value) {
    _$initialDateAtom.context.conditionallyRunInAction(() {
      super.initialDate = value;
      _$initialDateAtom.reportChanged();
    }, _$initialDateAtom, name: '${_$initialDateAtom.name}_set');
  }

  final _$finalDateAtom = Atom(name: 'PatientServiceBase.finalDate');

  @override
  DateTime get finalDate {
    _$finalDateAtom.context.enforceReadPolicy(_$finalDateAtom);
    _$finalDateAtom.reportObserved();
    return super.finalDate;
  }

  @override
  set finalDate(DateTime value) {
    _$finalDateAtom.context.conditionallyRunInAction(() {
      super.finalDate = value;
      _$finalDateAtom.reportChanged();
    }, _$finalDateAtom, name: '${_$finalDateAtom.name}_set');
  }

  final _$selectedFieldAtom = Atom(name: 'PatientServiceBase.selectedField');

  @override
  String get selectedField {
    _$selectedFieldAtom.context.enforceReadPolicy(_$selectedFieldAtom);
    _$selectedFieldAtom.reportObserved();
    return super.selectedField;
  }

  @override
  set selectedField(String value) {
    _$selectedFieldAtom.context.conditionallyRunInAction(() {
      super.selectedField = value;
      _$selectedFieldAtom.reportChanged();
    }, _$selectedFieldAtom, name: '${_$selectedFieldAtom.name}_set');
  }

  final _$statusInitialDateAtom =
      Atom(name: 'PatientServiceBase.statusInitialDate');

  @override
  bool get statusInitialDate {
    _$statusInitialDateAtom.context.enforceReadPolicy(_$statusInitialDateAtom);
    _$statusInitialDateAtom.reportObserved();
    return super.statusInitialDate;
  }

  @override
  set statusInitialDate(bool value) {
    _$statusInitialDateAtom.context.conditionallyRunInAction(() {
      super.statusInitialDate = value;
      _$statusInitialDateAtom.reportChanged();
    }, _$statusInitialDateAtom, name: '${_$statusInitialDateAtom.name}_set');
  }

  final _$statusFinalDateAtom =
      Atom(name: 'PatientServiceBase.statusFinalDate');

  @override
  bool get statusFinalDate {
    _$statusFinalDateAtom.context.enforceReadPolicy(_$statusFinalDateAtom);
    _$statusFinalDateAtom.reportObserved();
    return super.statusFinalDate;
  }

  @override
  set statusFinalDate(bool value) {
    _$statusFinalDateAtom.context.conditionallyRunInAction(() {
      super.statusFinalDate = value;
      _$statusFinalDateAtom.reportChanged();
    }, _$statusFinalDateAtom, name: '${_$statusFinalDateAtom.name}_set');
  }

  final _$statusFieldAtom = Atom(name: 'PatientServiceBase.statusField');

  @override
  bool get statusField {
    _$statusFieldAtom.context.enforceReadPolicy(_$statusFieldAtom);
    _$statusFieldAtom.reportObserved();
    return super.statusField;
  }

  @override
  set statusField(bool value) {
    _$statusFieldAtom.context.conditionallyRunInAction(() {
      super.statusField = value;
      _$statusFieldAtom.reportChanged();
    }, _$statusFieldAtom, name: '${_$statusFieldAtom.name}_set');
  }

  final _$PatientServiceBaseActionController =
      ActionController(name: 'PatientServiceBase');

  @override
  dynamic setInitialDate(BuildContext context) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setInitialDate(context);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDate(BuildContext context) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setFinalDate(context);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedField(String item) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setSelectedField(item);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatusInitialDateSelected(bool value) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setStatusInitialDateSelected(value);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatusFinalDateSelected(bool value) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setStatusFinalDateSelected(value);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatusFieldSelected(bool value) {
    final _$actionInfo = _$PatientServiceBaseActionController.startAction();
    try {
      return super.setStatusFieldSelected(value);
    } finally {
      _$PatientServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'initialDate: ${initialDate.toString()},finalDate: ${finalDate.toString()},selectedField: ${selectedField.toString()},statusInitialDate: ${statusInitialDate.toString()},statusFinalDate: ${statusFinalDate.toString()},statusField: ${statusField.toString()},getInitialDate: ${getInitialDate.toString()},getFinalDate: ${getFinalDate.toString()},getSelectedField: ${getSelectedField.toString()},buttonAvailable: ${buttonAvailable.toString()}';
    return '{$string}';
  }
}
