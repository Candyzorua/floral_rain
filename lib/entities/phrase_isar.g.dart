// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhraseIsarCollection on Isar {
  IsarCollection<PhraseIsar> get phraseIsars => this.collection();
}

const PhraseIsarSchema = CollectionSchema(
  name: r'PhraseIsar',
  id: 8245003294180307726,
  properties: {
    r'definitions': PropertySchema(
      id: 0,
      name: r'definitions',
      type: IsarType.stringList,
    ),
    r'pinyin': PropertySchema(
      id: 1,
      name: r'pinyin',
      type: IsarType.string,
    ),
    r'simplified': PropertySchema(
      id: 2,
      name: r'simplified',
      type: IsarType.string,
    ),
    r'traditional': PropertySchema(
      id: 3,
      name: r'traditional',
      type: IsarType.string,
    )
  },
  estimateSize: _phraseIsarEstimateSize,
  serialize: _phraseIsarSerialize,
  deserialize: _phraseIsarDeserialize,
  deserializeProp: _phraseIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _phraseIsarGetId,
  getLinks: _phraseIsarGetLinks,
  attach: _phraseIsarAttach,
  version: '3.1.0+1',
);

int _phraseIsarEstimateSize(
  PhraseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.definitions.length * 3;
  {
    for (var i = 0; i < object.definitions.length; i++) {
      final value = object.definitions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.pinyin.length * 3;
  bytesCount += 3 + object.simplified.length * 3;
  bytesCount += 3 + object.traditional.length * 3;
  return bytesCount;
}

void _phraseIsarSerialize(
  PhraseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.definitions);
  writer.writeString(offsets[1], object.pinyin);
  writer.writeString(offsets[2], object.simplified);
  writer.writeString(offsets[3], object.traditional);
}

PhraseIsar _phraseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhraseIsar(
    definitions: reader.readStringList(offsets[0]) ?? [],
    pinyin: reader.readString(offsets[1]),
    simplified: reader.readString(offsets[2]),
    traditional: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _phraseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _phraseIsarGetId(PhraseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _phraseIsarGetLinks(PhraseIsar object) {
  return [];
}

void _phraseIsarAttach(IsarCollection<dynamic> col, Id id, PhraseIsar object) {
  object.id = id;
}

extension PhraseIsarQueryWhereSort
    on QueryBuilder<PhraseIsar, PhraseIsar, QWhere> {
  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhraseIsarQueryWhere
    on QueryBuilder<PhraseIsar, PhraseIsar, QWhereClause> {
  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PhraseIsarQueryFilter
    on QueryBuilder<PhraseIsar, PhraseIsar, QFilterCondition> {
  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'definitions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'definitions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'definitions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'definitions',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'definitions',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      definitionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'definitions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pinyin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pinyin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> pinyinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      pinyinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pinyin',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> simplifiedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> simplifiedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'simplified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'simplified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition> simplifiedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'simplified',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'simplified',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      simplifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'simplified',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'traditional',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'traditional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'traditional',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traditional',
        value: '',
      ));
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterFilterCondition>
      traditionalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'traditional',
        value: '',
      ));
    });
  }
}

extension PhraseIsarQueryObject
    on QueryBuilder<PhraseIsar, PhraseIsar, QFilterCondition> {}

extension PhraseIsarQueryLinks
    on QueryBuilder<PhraseIsar, PhraseIsar, QFilterCondition> {}

extension PhraseIsarQuerySortBy
    on QueryBuilder<PhraseIsar, PhraseIsar, QSortBy> {
  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortByPinyin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinyin', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortByPinyinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinyin', Sort.desc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortBySimplified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortBySimplifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.desc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortByTraditional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'traditional', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> sortByTraditionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'traditional', Sort.desc);
    });
  }
}

extension PhraseIsarQuerySortThenBy
    on QueryBuilder<PhraseIsar, PhraseIsar, QSortThenBy> {
  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenByPinyin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinyin', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenByPinyinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinyin', Sort.desc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenBySimplified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenBySimplifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'simplified', Sort.desc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenByTraditional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'traditional', Sort.asc);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QAfterSortBy> thenByTraditionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'traditional', Sort.desc);
    });
  }
}

extension PhraseIsarQueryWhereDistinct
    on QueryBuilder<PhraseIsar, PhraseIsar, QDistinct> {
  QueryBuilder<PhraseIsar, PhraseIsar, QDistinct> distinctByDefinitions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'definitions');
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QDistinct> distinctByPinyin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinyin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QDistinct> distinctBySimplified(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'simplified', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhraseIsar, PhraseIsar, QDistinct> distinctByTraditional(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'traditional', caseSensitive: caseSensitive);
    });
  }
}

extension PhraseIsarQueryProperty
    on QueryBuilder<PhraseIsar, PhraseIsar, QQueryProperty> {
  QueryBuilder<PhraseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhraseIsar, List<String>, QQueryOperations>
      definitionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'definitions');
    });
  }

  QueryBuilder<PhraseIsar, String, QQueryOperations> pinyinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinyin');
    });
  }

  QueryBuilder<PhraseIsar, String, QQueryOperations> simplifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'simplified');
    });
  }

  QueryBuilder<PhraseIsar, String, QQueryOperations> traditionalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'traditional');
    });
  }
}
