import 'package:expensetracker/notifications/notifications.dart';
import 'package:expensetracker/timer/counterWidget.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CountdownController();
    controller.pause();
    int dur = 3;

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Center(
            child: Countdown(
              controller: controller,
              seconds: dur,
              build: (BuildContext context, double time) {
                /// Disable when initiiazed
                if (dur == time) {
                  controller.pause();
                }
                return counterWidget(time);
              },
              interval: Duration(milliseconds: 100),
              onFinished: () {
                print('Timer is done!');
                notificationNow();
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              controller.resume();
            },
            child: Text("Resume"),
          ),
          RaisedButton(
            onPressed: () {
              controller.pause();
            },
            child: Text("Stop"),
          ),
          RaisedButton(
            onPressed: () {
              controller.restart();
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
