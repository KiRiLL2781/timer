import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int seconds = 0;
  Timer? timer;
  bool start = false;

  void stopTimer() {
    
    start = false;
    timer?.cancel();
    setState(() {});
  }

  void resetTimer() {
    seconds == 0;
  }

  void startTimer() {
    () {
      start=true;
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (seconds >= 0) {
          seconds++;
        }
        setState(() {});
      });
    };
  }

  buildButton() {
    if (seconds == 0) {
      return button(Colors.deepOrange, 'start', startTimer);
    }

    if (timer!.isActive == false) {
      button(Colors.deepOrange, 'continue', startTimer);
    }
    return button(Colors.deepOrange, 'stop', stopTimer);
  }

  Widget button(Color color, String text, Function() onClicked) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 25.0,
                    offset: Offset(0, 0),
                  )
                ],
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(200),
              ),
              width: 300,
              height: 300,
              child: Text(
                '$seconds',
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          buildButton(),
          const SizedBox(
            height: 25,
          ),
          button(
            Colors.deepOrange,
            "reset", resetTimer
          ),
        ],
      ),
    );
  }
}
