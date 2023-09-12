import 'package:floral_rain/const.dart';
import 'package:floral_rain/services/isar_service.dart';
import 'package:flutter/material.dart';

import '../entities/stats_isar.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              child: Text(
                'your records',
                style: STATS_LARGE_TEXT_STYLE,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                children: [
                  StatsCard('highest score', Icons.trending_up_rounded,
                      Colors.pink, 1),
                  const SizedBox(height: 10),
                  StatsCard('longest word', Icons.lightbulb_rounded,
                      Colors.pinkAccent, 2),
                  const SizedBox(height: 10),
                  StatsCard('rounds played', Icons.av_timer_rounded,
                      Colors.pinkAccent[100]!, 3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  StatsCard(this.title, this.icon, this.bgColor, this.id, {super.key});

  final String title;
  final IconData icon;
  final Color bgColor;
  final int id;
  final IsarService isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isarService.getStatStream(id),
        builder: (BuildContext context, AsyncSnapshot<Stream<StatsIsar?>> snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Card(
              elevation: 0,
              color: bgColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else {
            return StreamBuilder<StatsIsar?>(
                stream: snapshot.data,
                builder:
                    (BuildContext context, AsyncSnapshot<StatsIsar?> snapshot) {
                  return Card(
                      elevation: 0,
                      color: bgColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      )),
                      child: ListTile(
                        iconColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20.0),
                        leading: Icon(icon),
                        title: Text(
                          title,
                          style: STATS_TITLE_TEXT_STYLE,
                        ),
                        subtitle: Text(
                          snapshot.data?.strValue ?? "-",
                          style: STATS_SUBTITLE_TEXT_STYLE,
                        ),
                      ));
                });
          }
        });
  }
}
