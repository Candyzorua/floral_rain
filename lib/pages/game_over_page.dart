import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final int score;
  const GameOverPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    void _goBackTwoPages() {
      Navigator.of(context).pushNamed('/');
    }

    return Scaffold(
        body: Container(
            color: STANDARD_GREEN,
            child: Column(
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      foregroundDecoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/falling_flowers.png'),
                            fit: BoxFit.fill),
                      ))),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'game over!',
                        style: GAME_OVER_LARGE_TEXT_STYLE,
                      ),
                      Text(
                        'final score: $score',
                        style: GAME_OVER_LIGHT_TEXT_STYLE,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: STANDARD_GREEN,
                            onPressed: _goBackTwoPages,
                            child: const Icon(Icons.arrow_right_alt_rounded)),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
