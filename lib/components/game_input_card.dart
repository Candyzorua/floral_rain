import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const.dart';
import '../state/game_provider.dart';
import '../state/game_state.dart';

class GameInputCard extends ConsumerWidget {
  final String title;
  final textEditingController = TextEditingController();

  GameInputCard(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GameState> gameState = ref.watch(gameNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GAME_CURRENT_TEXT_STYLE),
          Card(
              elevation: 0,
              color: STANDARD_GREY,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(25),
              )),
              child: ListTile(
                  title: TextField(
                    controller: textEditingController,
                    style: GAME_LARGE_TEXT_STYLE,
                    autofocus: true,
                  ),
                  trailing: FloatingActionButton(
                      backgroundColor: STANDARD_GREEN,
                      elevation: 0,
                      mini: true,
                      child: const Icon(Icons.arrow_right_alt_rounded),
                      onPressed: () {
                        ref.read(gameNotifierProvider.notifier).submitPhrase(textEditingController.text, "simplified", gameState.value!);
                      }),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20.0))),
        ],
      ),
    );
  }
}
