import 'package:floral_rain/components/game_display_card.dart';
import 'package:floral_rain/components/invalid_phrase_text.dart';
import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

import '../components/game_input_card.dart';

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
            const GameDisplayCard('previous'),
            GameInputCard('current'),
            const InvalidPhraseText()
          ],
        ),
      ),
    );
  }
}
