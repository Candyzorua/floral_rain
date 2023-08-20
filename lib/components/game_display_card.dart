import 'package:floral_rain/state/game_provider.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const.dart';
import 'definitions.dart';

class GameDisplayCard extends ConsumerWidget {
  final String title;
  const GameDisplayCard(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GameState> gameState = ref.watch(gameNotifierProvider);

    return gameState.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => const Text('Oops, something unexpected happened'),
        data: (gs) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GAME_PREVIOUS_TEXT_STYLE),
                  Card(
                      elevation: 0,
                      color: STANDARD_GREY,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      )),
                      child: ListTile(
                          title: Text(
                            gs.previous.simplified,
                            style: GAME_LARGE_TEXT_STYLE,
                          ),
                          subtitle: Definitions(gs.previous.definitions),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20.0))),
                ],
              ),
            ));
  }
}
