import 'package:isar/isar.dart';

part 'phrase_isar.g.dart';

@collection
class PhraseIsar {
  Id id = Isar.autoIncrement;
  List<String> definitions;
  String simplified;
  String traditional;
  String pinyin;

  PhraseIsar({
    required this.definitions,
    required this.simplified,
    required this.traditional,
    required this.pinyin
  });

  factory PhraseIsar.fromJson(Map<String, dynamic> json) {
    return PhraseIsar(
        definitions: json['definitions'].cast<String>(),
        simplified: json['simplified'],
        traditional: json['traditional'],
        pinyin: json['pinyin']
    );
  }
}