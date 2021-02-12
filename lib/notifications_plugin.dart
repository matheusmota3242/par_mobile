import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsPlugin {
  final notifications = FlutterLocalNotificationsPlugin();

  NotificationsPlugin() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    final androidSettings = AndroidInitializationSettings('anel_de_sino');
    final iosSettings = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) =>
          onSelectedNotification(),
    );

    notifications.initialize(
    InitializationSettings(androidSettings, iosSettings),
  );
  }
  

  Future onSelectedNotification() async => print('>> Notificação selecionada');


  NotificationDetails get _ongoing {
  final androidChannelSpecifies = AndroidNotificationDetails(
      '', 'channelName', 'channelDescription',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      autoCancel: false);
  final iosChannelSpecifies = IOSNotificationDetails();

  return NotificationDetails(androidChannelSpecifies, iosChannelSpecifies);
}

void callOnGoingFunction(Map<String, dynamic> message) {
  
  showOnGoingNotification(notifications, title: message['notification']['title'], body: message['notification']['body']);
}

Future _showNotification(FlutterLocalNotificationsPlugin notifications,
        {String title,
         String body,
         NotificationDetails type,
        int id = 0}) => notifications.show(id, body, title, type);

Future showOnGoingNotification(FlutterLocalNotificationsPlugin notifications,
        {String title,
         String body,
        int id = 0}) => _showNotification(notifications, title: title, body: body, type: _ongoing);
}