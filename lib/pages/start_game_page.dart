import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/game_provider.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ShowBottomSheetExample());
  }
}

class ShowBottomSheetExample extends StatelessWidget {
  const ShowBottomSheetExample({super.key});

  void activateBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    flex: 7,
                    child: Image.asset('assets/floral_rain_logo_black.png')),
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.pink,
                                  Colors.purple,
                                  Colors.blue,
                                ],
                              ),
                            ),
                          ),
                        ),
                        const StartGameButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      activateBottomSheet(context);
    });
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/japanese-cherry-garden-bridge-and-sakura-blossom_19804660_cropped.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class StartGameButton extends ConsumerWidget {
  const StartGameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 20.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/in-game');
        ref.read(gameNotifierProvider.notifier).initialize();
      },
      child: Text('start game', style: START_GAME_LARGE_TEXT_STYLE),
    );
  }
}
