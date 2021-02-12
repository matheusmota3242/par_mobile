import 'package:flutter/material.dart';
import 'package:par_mobile/screens/login_screen.dart';

class LogoutPoupup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        _negativeButton(context),
        _positiveButton(context),
      ],
      title: Text('Logout'),
      content: Text('Tem certeza que deseja sair?'),
    );
  }

  Widget _positiveButton(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
      child: Text('Sim'),
    );
  }

  Widget _negativeButton(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Cancelar'),
    );
  }
}
