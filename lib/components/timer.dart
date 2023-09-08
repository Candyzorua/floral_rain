import 'dart:async';
import 'package:floral_rain/const.dart';
import 'package:floral_rain/pages/game_over_page.dart';
import 'package:floral_rain/state/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/game_state.dart';

class FloralTimer extends ConsumerStatefulWidget {
  const FloralTimer({super.key});

  @override
  ConsumerState<FloralTimer> createState() => _FloralTimerState();
}

class _FloralTimerState extends ConsumerState<FloralTimer> {
  // timer
  static const maxSeconds = TIME_LIMIT_SECONDS;
  int seconds = maxSeconds;
  Timer? timer;

  _FloralTimerState() {
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      gameNotifierProvider,
      (previous, next) {
        next.whenData((value) => {
              if (value.stopTimer ?? false)
                {_stopTimer()}
              else if (value.error == null)
                {_resetTimer()}
            });
      },
    );
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 10.0,
        color: STANDARD_PINK,
        value: seconds / maxSeconds,
      ),
    );
  }

  // timer helper functions

  void _startTimer() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => {
              if (seconds > 0)
                {
                  setState(() {
                    seconds--;
                  })
                }
              else
                {_navigateToGameOverPage()}
            });
  }

  void _stopTimer() {
    timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      seconds = maxSeconds;
    });
    _startTimer();
  }

  void _navigateToGameOverPage() {
    _stopTimer();
    AsyncValue<GameState> currGameState = ref.read(gameNotifierProvider);
    currGameState.whenData((value) => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameOverPage(score: value.score)),
        ));
  }
}
