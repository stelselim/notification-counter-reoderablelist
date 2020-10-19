import 'package:expensetracker/notifications/notifications_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future notificationNow() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'Notify Appp', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, 'Notify App', 'Come TO APP', platformChannelSpecifics,
      payload: 'item x');
}

Future notificationSchedule() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 3));
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  NotificationDetails platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.schedule(
      0,
      'scheduled title',
      'scheduled body',
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}

Future periodicSchedule() async {
  // Show a notification every minute with the first appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
      'repeating description');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
      'repeating body', RepeatInterval.EveryMinute, platformChannelSpecifics);
}

Future dailyNotification() async {
  var time = Time(10, 0, 0);

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      'repeatDailyAtTime description');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'show daily title',
      'Daily notification shown at approximately',
      time,
      platformChannelSpecifics);
}

Future deleteNotification() async {
  // cancel the notification with id value of zero
  await flutterLocalNotificationsPlugin.cancel(0);
}

Future deleteAllNotifications() async {
  // cancel the notification with id value of zero
  await flutterLocalNotificationsPlugin.cancelAll();
}
