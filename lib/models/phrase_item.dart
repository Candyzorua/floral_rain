class PhraseItem {
  final List<String> definitions;
  final String simplified;
  final String traditional;
  final String pinyin;
  final String id;

  const PhraseItem({
    required this.definitions,
    required this.simplified,
    required this.traditional,
    required this.pinyin,
    required this.id
  });

  factory PhraseItem.fromJson(Map<String, dynamic> json) {
    return PhraseItem(
      definitions: json['definitions'].cast<String>(),
      simplified: json['simplified'],
      traditional: json['traditional'],
      pinyin: json['pinyin'],
      id: json['id']
    );
  }
}