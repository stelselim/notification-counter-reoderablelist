import 'package:expensetracker/notifications/notificationBody.dart';
import 'package:expensetracker/notifications/notifications_config.dart';
import 'package:expensetracker/timer/timer.dart';
import 'package:expensetracker/trials/trialwidget.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/notifications/notifications.dart';

void main() {
  /// Initiliaze before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  try {
    initNotification();
  } catch (e) {
    print(e);
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget switchBody(int bodyIndex) {
    if (bodyIndex == 2) {
      return TrialWidget();
    }
    if (bodyIndex == 1) {
      return TimerWidget();
    }
    if (bodyIndex == 0) {
      return NotificationBody();
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: switchBody(index),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              color: index == 0 ? Colors.blue : null,
              icon: Icon(Icons.notifications),
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
              color: index == 1 ? Colors.blue : null,
              icon: Icon(Icons.timelapse),
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            IconButton(
              color: index == 2 ? Colors.blue : null,
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
