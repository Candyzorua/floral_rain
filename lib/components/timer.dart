import 'dart:async';
import 'package:flutter/material.dart';

class FloralTimer extends StatefulWidget {
  const FloralTimer({super.key});

  @override
  State<FloralTimer> createState() => _TimerState();
}

class _TimerState extends State<FloralTimer> {
  // timer
  int seconds = maxSeconds;
  Timer? timer;
  static const maxSeconds = 60;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: seconds / maxSeconds,
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // timer helper functions

  void _startTimer() {
    timer = Timer.periodic(
        const Duration(milliseconds: 100),
            (_) => setState(() {
          if (seconds > 0) {
            seconds--;
          } else {
            _stopTimer();
          }
        }));
  }

  void _stopTimer() {
    timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }
}