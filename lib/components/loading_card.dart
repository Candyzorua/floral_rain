import 'package:flutter/material.dart';
import '../const.dart';

class LoadingOrErrorCard extends StatelessWidget {
  final Widget innerWidget;

  const LoadingOrErrorCard(this.innerWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 0,
              color: STANDARD_GREY,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  )),
              child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      innerWidget
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20.0))),
        ],
      ),
    );
  }
}
