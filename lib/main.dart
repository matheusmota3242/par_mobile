import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:par_mobile/services/patient_service.dart';
import 'package:par_mobile/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:par_mobile/screens/alert_screen.dart';
import 'package:par_mobile/screens/login_screen.dart';
import 'package:par_mobile/screens/splash_screen.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/state/firebase_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseCloudMessagingState>(
          create: (_) => FirebaseCloudMessagingState(),
        ),
        //Provider<FirebaseCloudMessagingState>(create: (_) => FirebaseCloudMessagingState(),),
        Provider<PatientService>(
          create: (_) => PatientService(),
        ),
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
        Provider<UserService>(
          create: (_) => UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        theme: ThemeData(
            primaryColorLight: Color(0xFF1c4492),
            primaryColor: Color(0xFF181a32),
            accentColor: Color(0xFF4bb175)),
        home: LoginScreen(),
      ),
    );
  }
}
