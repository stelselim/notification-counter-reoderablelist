import 'package:expensetracker/notifications/notifications.dart';
import 'package:expensetracker/notifications/notifications_config.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.blue.shade100,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Notification Now")),
                onPressed: () async {
                  notificationNow();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Show Later")),
                onPressed: () async {
                  notificationSchedule();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Periodic Notification")),
                onPressed: () async {
                  periodicSchedule();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Daily Notification")),
                onPressed: () async {
                  dailyNotification();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Show Notifications")),
                onPressed: () async {
                  /// Repetitive or Scheduled will appear
                  var pendingNotificationRequests =
                      await flutterLocalNotificationsPlugin
                          .pendingNotificationRequests();
                  pendingNotificationRequests.forEach((element) {
                    print("Notification: " + element.title);
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text("Delete Notification")),
                onPressed: () async {
                  deleteNotification();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text("delete all Notification"),
                ),
                onPressed: () async {
                  deleteAllNotifications();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
