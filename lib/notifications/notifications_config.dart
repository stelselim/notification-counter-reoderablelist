import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initNotification() async {
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);

  var result = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

  FlutterLocalNotificationsPlugin().initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
  });
}

Future<dynamic> selectNotification(String payload) async {
  if (payload != null) {
    print('notification payload: ' + payload);
  }
}

Future onDidReceiveLocalNotification(
    int a, String payload, String d, String ds) async {
  if (payload != null) {
    print('notification payload: ' + payload);
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
var initializationSettingsIOS = IOSInitializationSettings(
  requestSoundPermission: false,
  requestBadgePermission: false,
  requestAlertPermission: false,
  onDidReceiveLocalNotification: onDidReceiveLocalNotification,
);
