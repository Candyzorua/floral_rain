import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

import '../entities/rules.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.white, child: Column(
      children: [
        Expanded(child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('game rules', style: RULES_TITLE_TEXT_STYLE),
                ],
              ),
            ),
            RulesCard(rule: CHAIN_PHRASE_RULE),
            RulesCard(rule: DRY_RULE),
            RulesCard(rule: LONGER_IS_BETTER_RULE)
          ],
        ))
      ],
    )));
  }
}

class RulesCard extends StatelessWidget {
  final Rules rule;
  const RulesCard({super.key, required this.rule});

  @override
  Widget build(BuildContext context) {
    final images = <Image>[];
    for (var i in rule.images) {
      images.add(Image(
        image: AssetImage(i),
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Column(children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(rule.title, style: RULES_LARGE_TEXT_STYLE),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(rule.body, style: RULES_SMALL_TEXT_STYLE,),
          ),
        ),
        Column(
          children: images,
        ),
      ])),
    );
  }
}
