import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

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
          decoration: const BoxDecoration(
              color: Colors.white),
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
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
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 20.0),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: Text('start game', style: START_GAME_LARGE_TEXT_STYLE),
                      ),
                    ],
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
