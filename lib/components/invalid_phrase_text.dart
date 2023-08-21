import 'package:floral_rain/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/game_provider.dart';
import '../state/game_state.dart';

/// shows invalid phrase text when game state isInvalidPhrase is true and nothing if not
class InvalidPhraseText extends ConsumerWidget {
  const InvalidPhraseText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GameState> gameState = ref.watch(gameNotifierProvider);
    return gameState.when(
        loading: () => const SizedBox.shrink(), // empty view
        error: (error, stack) => const SizedBox.shrink(),
        data: (gs) => gs.error != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(gs.error.toString(), style: GAME_ERROR_TEXT_STYLE),
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink());
  }
}
