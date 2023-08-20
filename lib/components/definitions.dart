import 'package:flutter/cupertino.dart';

class Definitions extends StatelessWidget {
  const Definitions(this.definitions, {super.key});
  final List<String> definitions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: definitions.map((e){ return Text('- ${e}');}).toList()
    );
  }
}
