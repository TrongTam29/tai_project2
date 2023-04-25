import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TimerApp extends StatefulWidget {
  TimerApp();

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int minutes2 = 0;
  int seconds2 = 45;
  int breakTime2 = 15;

  int minutes = 0;
  int seconds = 45;
  int breakTime = 15;

  bool exerOrBreak = true;
  bool continueOrBreak = false;
  String labelText = "Let's Do It";
  String active = "Let's Do Exercise";

  late Timer timer;

  void restartTimerExer() {
    setState(() {
      minutes = minutes2;
      seconds = seconds2;
      exerOrBreak = true;
      flushBarExer(context);
    });
    startTimer();
  }

  void flushBarExer(BuildContext context) {
    Flushbar(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
      borderRadius: BorderRadius.circular(20),
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade400, Colors.green.shade200],
        stops: [0.6, 1],
      ),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Icon(
        Icons.directions_run_outlined,
        size: 35,
      ),
      messageText: Text("Let's Do Exercise",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Wellfleet-Regular',
              color: Colors.black)),
      messageColor: Colors.black,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  void restartTimerBreak() {
    setState(() {
      seconds = breakTime2;
      exerOrBreak = false;
      active = "Let's Breathe";
    });
    flushBarBreak(context);
    startTimer();
  }

  void flushBarBreak(BuildContext context) {
    Flushbar(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
      borderRadius: BorderRadius.circular(20),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade400, Colors.blue.shade200],
        stops: [0.6, 1],
      ),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Icon(
        Icons.task_alt_outlined,
        size: 35,
      ),
      messageText: Text("Let's Breathe",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Wellfleet-Regular',
              color: Colors.black)),
      messageColor: Colors.black,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  void timerPaused() {
    if (timer.isActive == true) {
      timer.cancel();
      labelText = "Let's Do It";
    }
  }

  Future<void> startTimer() async {
    labelText = 'Pause';
    if ((minutes != 0) || (seconds != 0)) {
      timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
        setState(() {
          if ((minutes > 0) || (seconds > 0)) {
            if (seconds > 0) {
              seconds--;
            }
            if ((seconds == 0) & (minutes > 0)) {
              minutes--;
              seconds = 59;
            }
          } else if ((seconds == 0) & (minutes == 0)) {
            timer.cancel();
            if (exerOrBreak == true) {
              restartTimerBreak();
            } else
              restartTimerExer();
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive == true) {
      timer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LabelText(label: 'MIN', value: minutes.toString().padLeft(2, '0')),
            SizedBox(
              width: size.width * 0.1 - 15,
            ),
            LabelText(label: 'SEC', value: seconds.toString().padLeft(2, '0')),
          ],
        ),
        SizedBox(height: size.height * 0.1 - 20),
        ElevatedButton.icon(
          label: Text(
            labelText,
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          icon: Icon(
            Icons.hourglass_bottom_rounded,
            size: 18,
            color: Colors.black87,
          ),
          onPressed: () {
            setState(() {
              continueOrBreak = !continueOrBreak;
            });
            if (continueOrBreak == false) {
              timerPaused();
            } else
              startTimer();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white))),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 15, horizontal: 45)),
          ),
        ),
      ],
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kPrimaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
