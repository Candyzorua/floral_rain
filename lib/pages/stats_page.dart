import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';

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
                  const StatsCard('highest score', '40',
                      Icons.trending_up_rounded, Colors.pink),
                  const SizedBox(height: 10),
                  const StatsCard('longest word', '30', Icons.lightbulb_rounded,
                      Colors.pinkAccent),
                  const SizedBox(height: 10),
                  StatsCard('rounds played', '20', Icons.av_timer_rounded,
                      Colors.pinkAccent[100]!),
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
  const StatsCard(this.title, this.subtitle, this.icon, this.bgColor, {super.key});

  final String title;
  final String subtitle;
  final IconData icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 0,
    color: bgColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
    child: ListTile(
      iconColor: Colors.white,
      contentPadding:
      const EdgeInsets.symmetric(vertical: 15, horizontal: 20.0),
      leading: Icon(icon),
      title: Text(
        title,
        style: STATS_TITLE_TEXT_STYLE,
      ),
      subtitle: Text(
        subtitle,
        style: STATS_SUBTITLE_TEXT_STYLE,
      ),
    ));
  }
}
