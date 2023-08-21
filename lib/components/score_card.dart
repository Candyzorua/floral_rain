import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/game_provider.dart';
import '../state/game_state.dart';

class ScoreCard extends ConsumerStatefulWidget {
  const ScoreCard({super.key});

  @override
  ConsumerState<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends ConsumerState<ScoreCard> {
  int scoreCardScore = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      gameNotifierProvider,
          (previous, next) {
        next.whenData((value) => {
          setState((){
            scoreCardScore = value.score;
          })
        });
      },
    );

    return SizedBox(
      width: 130,
      height: 75,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('current score', style: GAME_LIGHT_TEXT_STYLE,),
            Text('$scoreCardScore', style: GAME_LARGE_TEXT_STYLE,)
          ],
        ),
      ),
    );
  }
}