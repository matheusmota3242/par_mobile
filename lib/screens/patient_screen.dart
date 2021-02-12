import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:par_mobile/controllers/firebase_controller.dart';
import 'package:par_mobile/dummy_data.dart';
import 'package:par_mobile/models/api_response_model.dart';
import 'package:par_mobile/models/patient_model.dart';
import 'package:par_mobile/services/api_service.dart';
import 'package:par_mobile/services/patient_service.dart';
import 'package:par_mobile/state/firebase_state.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:par_mobile/widgets/appbar.dart';
import 'package:par_mobile/widgets/error_container.dart';
import 'package:par_mobile/widgets/menu_drawer.dart';
import 'package:par_mobile/widgets/patient_card.dart';

class PatientScreen extends StatefulWidget {
  final String jwt;

  const PatientScreen({Key key, this.jwt}) : super(key: key);
  @override
  _PatientScreen createState() => _PatientScreen();
}

class _PatientScreen extends State<PatientScreen> {
  FirebaseCloudMessagingState currentState;
  final FirebaseController firebaseController = FirebaseController();
  ApiService _apiService = ApiService();
  List<Patient> patients = [];
  ApiResponse<List<Patient>> _apiResponse;
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isLoadingScroll = false;
  @override
  void initState() {
    _fetchPatients();
    _carregaPaginacao();
    super.initState();
  }

  _fetchPatients() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse =
        await _apiService.getHospitalizedPatients(GlobalVar().jwt, true);
    patients = _apiResponse.data;
    setState(() {
      isLoading = false;
    });
  }

  _carregaPaginacao() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 50 >
          _scrollController.position.maxScrollExtent) {
        if (!isLoadingScroll) {
          isLoadingScroll = true;
          _apiService
              .getHospitalizedPatients(GlobalVar().jwt, false)
              .then((value) {
            isLoadingScroll = false;
            if (value.isError == false && value.data.isNotEmpty) {
              setState(() {
                _apiResponse.data += value.data;
              });
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _apiService = Provider.of<ApiService>(context, listen: false);
    final _controller = Provider.of<PatientService>(context);
    _controller.patients = patients;

    return Scaffold(
      appBar: MyAppBar(
        title: 'PACIENTES INTERNADOS',
      ),
      drawer: MenuDrawer(),
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

        if (_apiResponse.data.isEmpty) {
          return Center(
            child: Text(
              'Não há pacientes internados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 12),
          itemCount: _apiResponse.data.length,
          itemBuilder: (context, index) => PatientCard(
            patient: _apiResponse.data[index],
            buttonsVisibility: true,
            labelVisibility: true,
          ),
        );
      }),
    );
  }

  getPatientsFromResponse(controller) {
    patients = _apiResponse.data;
  }
  /* Widget selectIconState(state, BuildContext context) {
    switch (state.getTopicSubscribeState) {
      case TopicSubscribeState.subscribed:
        return IconButton(
          onPressed: unsubscribeAction,
          color: Theme.of(context).primaryColorLight,
          icon: Icon(Icons.close,),
        );
      case TopicSubscribeState.unsubscribed:
        return IconButton(
          onPressed: subscribeAction,
          color: Theme.of(context).primaryColorLight,
          icon: Icon(Icons.done),
        );
    }
  }

  subscribeAction() {
    firebaseController.subscribeToTopic();
    Fluttertoast.showToast(
        msg: "Conectado", fontSize: 16, backgroundColor: Colors.grey);
  }

  unsubscribeAction() {
    firebaseController.unsubscribeFromTopic();
    Fluttertoast.showToast(
        msg: "Desconectado", fontSize: 16, backgroundColor: Colors.grey);
  } */
}
