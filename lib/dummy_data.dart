import 'models/alert_model.dart';
import 'models/patient_model.dart';
import 'models/vital_sign_model.dart';

// final List<Patient> dummyPatients = [
//   Patient(1, '2889834', 'Seiya de Pegasus', '33 anos e 2 meses', 'Masculino'),
//   Patient(2, '8832237', 'Hyoga de Cisne', '34 anos e 4 meses', 'Masculino'),
//   Patient(3, '9870731', 'Shiryu de Dragão', '30 anos e 9 meses', 'Masculino'),
//   Patient(4, '3972110', 'Shun de Andrômeda', '29 anos e 3 meses', 'Indefinido'),
//   Patient(5, '1007235', 'Marin de Algo', '31 anos e 2 meses', 'Feminino'),
//   Patient(6, '0188433', 'Shina da Cobra', '33 anos e 5 meses', 'Feminino', null),
// ].toList();

final List<VitalSign> dummyVitalSigns = [
  VitalSign(1, new DateTime(2020, 3, 12, 15, 31, 12), 87.0),
  VitalSign(2, new DateTime(2020, 3, 12, 15, 31, 14), 82.0),
  VitalSign(3, new DateTime(2020, 3, 12, 15, 31, 16), 78.0),
  VitalSign(4, new DateTime(2020, 3, 12, 15, 31), 76.0),
  VitalSign(5, new DateTime(2020, 3, 12, 15, 31, 18), 83.0),
  VitalSign(6, new DateTime(2020, 3, 12, 15, 31, 21), 82.0),
  VitalSign(7, new DateTime(2020, 3, 12, 15, 31, 23), 80.0),
  VitalSign(8, new DateTime(2020, 3, 12, 15, 31, 24), 80.0),
].toList();

/* final List<Alert> dummyAlerts = [
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 12), 'Oximetria', 83.0, AlertType.inferior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 14), 'Oximetria', 82.0, AlertType.inferior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 16), 'PNId', 80.0, AlertType.superior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 17), 'PNId', 80.0, AlertType.inferior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 18), 'Respiração', 83.0, AlertType.superior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 21), 'Respiração', 82.0, AlertType.superior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 23), 'Respiração', 80.0, AlertType.inferior),
  Alert(1, new DateTime(2020, 3, 12, 15, 31, 24), 'PNIm', 80.0, AlertType.inferior),
]; */
