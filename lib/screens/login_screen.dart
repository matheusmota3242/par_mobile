import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:par_mobile/models/api_response_model.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/user_service.dart';
import 'package:par_mobile/state/firebase_state.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:par_mobile/widgets/toast.dart';
import 'package:provider/provider.dart';

import 'patient_screen.dart';

class LoginScreen extends StatelessWidget {
  final _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<String> authenticate(username, password) async {
    ApiResponse apiResponse = ApiResponse();
    apiResponse = await _apiService.authenticate(username, password);
    print(apiResponse);
    if (!apiResponse.isError) {
      String jwt = apiResponse.data;
      return jwt;
    }
    return null;
  }

  login(String username, String password, BuildContext context) async {
    var userService = Provider.of<UserService>(context, listen: false);

    String jwt = await authenticate(username, password);
    GlobalVar().jwt = jwt;
    if (jwt != null) {
      userService.username = username;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientScreen(),
        ),
      );
    } else {
      Toasts.showToast('Ocorreu um erro na autenticação.');
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _showCompanyName(context),
              _showUsernameTextField(context),
              _showPasswordTextField(context),
              _showLoginButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _showCompanyName(BuildContext context) {
    return Container(
      padding: new EdgeInsets.fromLTRB(
          0, MediaQuery.of(context).size.height / 5, 0, 0),
      child:
          /* new Text(
        'PAR',
        style: TextStyle(
          fontSize: 52.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor
        ),
        textAlign: TextAlign.center,
      ), */
          SizedBox(
        height: 60,
        child: Image(
          image: AssetImage('assets/par-logo-sem-descritivo.png'),
        ),
      ),
    );
  }

  Widget _showUsernameTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 8,
          left: MediaQuery.of(context).size.width / 8,
          right: MediaQuery.of(context).size.width / 8),
      child: TextFormField(
        controller: usernameController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.5)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColorLight)),
            prefixIcon: Icon(
              Icons.person,
              color: Theme.of(context).accentColor,
            ),
            hintText: 'Usuário',
            hintStyle: TextStyle(color: Theme.of(context).accentColor)),
      ),
    );
  }

  Widget _showPasswordTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 40.0,
          left: MediaQuery.of(context).size.width / 8,
          right: MediaQuery.of(context).size.width / 8),
      child: TextFormField(
        obscureText: true,
        controller: passwordController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 1.5)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColorLight)),
            prefixIcon: Icon(Icons.lock, color: Theme.of(context).accentColor),
            hintText: 'Senha',
            hintStyle: TextStyle(color: Theme.of(context).accentColor)),
      ),
    );
  }

  Widget _showLoginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 10,
          left: MediaQuery.of(context).size.width / 4,
          right: MediaQuery.of(context).size.width / 4),
      child: RaisedButton(
        onPressed: () {
          String username = usernameController.text;
          String password = passwordController.text;
          login(username, password, context);
        },
        child: Text(
          'Entrar',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }
}
