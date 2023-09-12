import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const.dart';
import '../pages/game_over_page.dart';
import '../state/game_provider.dart';
import '../state/game_state.dart';

class ReturnToHomePageButton extends ConsumerWidget {
  const ReturnToHomePageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateToGameOverPage() {
      AsyncValue<GameState> currGameState = ref.read(gameNotifierProvider);
      currGameState.whenData((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameOverPage(score: value.score)),
        );
      });
      ref.read(gameNotifierProvider.notifier).stopGameState();
    }

    return TextButton(
      onPressed: navigateToGameOverPage,
      child: Icon(Icons.clear, color: STANDARD_PINK));
  }
}
