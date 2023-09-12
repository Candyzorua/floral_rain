import 'package:isar/isar.dart';

part 'stats_isar.g.dart';

@collection
class StatsIsar {
  Id id = Isar.autoIncrement;
  String name;
  String? strValue;

  StatsIsar({required this.name, this.strValue});
}
