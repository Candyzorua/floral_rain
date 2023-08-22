import 'package:floral_rain/components/game_display_card.dart';
import 'package:floral_rain/components/invalid_phrase_text.dart';
import 'package:floral_rain/components/return_to_home_page_button.dart';
import 'package:floral_rain/components/score_card.dart';
import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

import '../components/game_input_card.dart';
import '../components/timer.dart';

class InGamePage extends StatefulWidget {
  const InGamePage({super.key});

  @override
  State<InGamePage> createState() => _InGamePageState();
}

class _InGamePageState extends State<InGamePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: BGCOLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloralTimer(),
                    ScoreCard(),
                  ],
                )),
            Expanded(
                flex: 8,
                child: ListView(
                  children: [
                    const GameDisplayCard('previous'),
                    GameInputCard('current'),
                    const InvalidPhraseText(),
                  ],
                )),
            const Expanded(
                flex: 2,
                child: ReturnToHomePageButton())
          ],
        ),
      ),
    );
  }
}
