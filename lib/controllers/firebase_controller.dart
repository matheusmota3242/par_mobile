import 'package:firebase_messaging/firebase_messaging.dart';
import '../state/firebase_state.dart';

class FirebaseController {
  FirebaseCloudMessagingState currentState;
  FirebaseMessaging fcm = FirebaseMessaging();
  final String _topic = 'alert-liga'; 

  Future<void> subscribeToTopic() async {
   
    fcm.subscribeToTopic(_topic);
    currentState.setFirebaseTopicState(TopicSubscribeState.subscribed);
  }

  Future<void> unsubscribeFromTopic() async {
    fcm.unsubscribeFromTopic(_topic);
    currentState.setFirebaseTopicState(TopicSubscribeState.unsubscribed);

  }
}