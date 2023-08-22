import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const.dart';
import '../state/game_provider.dart';

class ReturnToHomePageButton extends ConsumerWidget {
  const ReturnToHomePageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void returnToHomePage() {
      ref.read(gameNotifierProvider.notifier).stopGameState();
      Navigator.of(context).pushNamed('/');
    }

    return TextButton(
      onPressed: returnToHomePage,
      child: Icon(Icons.home, color: STANDARD_PINK));
  }
}
