import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:par_mobile/screens/login_screen.dart';
import 'package:par_mobile/util/GlobalVar.dart';
import 'package:par_mobile/widgets/logout_popup.dart';
import 'package:provider/provider.dart';

import 'package:par_mobile/controllers/firebase_controller.dart';
import 'package:par_mobile/state/firebase_state.dart';

import '../notifications_plugin.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  MyAppBar({Key key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  MyAppBarState createState() => MyAppBarState();
}

class MyAppBarState extends State<MyAppBar> {
  FirebaseCloudMessagingState currentState;
  final FirebaseController firebaseController = FirebaseController();
  final NotificationsPlugin _notificationsPlugin = NotificationsPlugin();

  final String topic = 'alert-liga';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseController.fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: ListTile(
            title: Text(message['notification']['title']),
            subtitle: Text(message['notification']['body']),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            )
          ],
        ),
      );
    }, onResume: (Map<String, dynamic> message) async {
      //_notificationsPlugin.callOnGoingFunction(message);
      print('onResume: $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      //_notificationsPlugin.callOnGoingFunction(message);

      print('onResume: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<FirebaseCloudMessagingState>(context);
    firebaseController.currentState = appState;
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: <Widget>[
        _selectIconButtonState(firebaseController.currentState, context),
      ],
    );
  }

  Widget _selectIconButtonState(
      FirebaseCloudMessagingState state, BuildContext context) {
    switch (state.getTopicSubscribeState) {
      case TopicSubscribeState.subscribed:
        return IconButton(
          onPressed: _unsubscribeAction,
          color: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.notifications_off,
            color: Colors.white,
          ),
        );
      case TopicSubscribeState.unsubscribed:
        return IconButton(
          onPressed: _subscribeAction,
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.notifications, color: Colors.white),
        );
    }
  }

  _subscribeAction() {
    firebaseController.subscribeToTopic();
    Fluttertoast.showToast(
        msg: "Conectado", fontSize: 16, backgroundColor: Colors.grey);
  }

  _unsubscribeAction() {
    firebaseController.unsubscribeFromTopic();
    Fluttertoast.showToast(
        msg: "Desconectado", fontSize: 16, backgroundColor: Colors.grey);
  }
}
