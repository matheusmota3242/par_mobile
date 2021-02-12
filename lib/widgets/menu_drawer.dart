import 'package:flutter/material.dart';
import 'package:par_mobile/screens/patient_history_screen.dart';
import 'package:par_mobile/screens/patient_screen.dart';
import 'package:par_mobile/services/user_service.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:provider/provider.dart';

import 'logout_popup.dart';

class MenuDrawer extends StatelessWidget {
  static const double usernameFontSize = 20.0;
  static const double userContainerHeight = 120.0;
  static const itemPaddingLTRB = [16.0, 12.0, 0.0, 12.0];
  final itemColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    var userService = Provider.of<UserService>(context, listen: false);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
              child: Text(
                userService.username,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: usernameFontSize,
                    fontWeight: FontWeight.w500),
              ),
            ),
            width: double.infinity,
            height: userContainerHeight,
            color: Theme.of(context).primaryColor,
          ),
          InkWell(
            onTap: () => _pushToHospitalizedPatients(context),
            child: Container(
                padding: EdgeInsets.fromLTRB(
                  itemPaddingLTRB[0],
                  16,
                  itemPaddingLTRB[2],
                  itemPaddingLTRB[3],
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_hotel, color: itemColor),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Pacientes Internados',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: itemColor),
                    ),
                  ],
                )),
          ),
          InkWell(
            onTap: () => _pushToPatientsHistory(context),
            child: Container(
                padding: EdgeInsets.fromLTRB(
                  itemPaddingLTRB[0],
                  itemPaddingLTRB[1],
                  itemPaddingLTRB[2],
                  itemPaddingLTRB[3],
                ),
                child: Row(
                  children: [
                    Icon(Icons.list_alt, color: itemColor),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Histórico de pacientes',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: itemColor),
                    ),
                  ],
                )),
          ),
          InkWell(
            onTap: () => _logout(context),
            child: Container(
                padding: EdgeInsets.fromLTRB(
                  itemPaddingLTRB[0],
                  itemPaddingLTRB[1],
                  itemPaddingLTRB[2],
                  itemPaddingLTRB[3],
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: itemColor),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: itemColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    GlobalVar().jwt = "";
    showDialog(
      context: context,
      builder: (context) => LogoutPoupup(),
    );
  }

  void _pushToPatientsHistory(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PatientHistoryScreen(
                  jwt: GlobalVar().jwt,
                )));
  }

  void _pushToHospitalizedPatients(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PatientScreen(
          jwt: GlobalVar().jwt,
        ),
      ),
    );
  }
}
