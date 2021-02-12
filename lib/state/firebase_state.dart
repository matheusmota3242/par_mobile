import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TopicSubscribeState {subscribed, unsubscribed}

class FirebaseCloudMessagingState with ChangeNotifier {
  
  TopicSubscribeState _appConnectionState = TopicSubscribeState.unsubscribed;
  void setFirebaseTopicState(TopicSubscribeState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  TopicSubscribeState get getTopicSubscribeState => _appConnectionState;
}