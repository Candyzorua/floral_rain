import 'dart:convert';
import 'dart:math';

import 'package:floral_rain/entities/phrase_isar.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../const.dart';
import '../helpers/phrase_checks.dart';
import '../state/game_state.dart';

class IsarService {
  late Future<Isar> db;
  final _random = Random();

  IsarService() {
    db = openDb();
    initializeDb();
  }

  /// Checks the phrase and returns the updated GameState.
  /// Throws error if word phrase does not exist
  /// or if pinyin does not match
  Future<GameState> getPhraseItem(
      String text, String type, GameState gameState) async {
    final isar = await db;
    late PhraseIsar? res;

    if (type == "simplified") {
      res = await isar.phraseIsars.filter().simplifiedEqualTo(text).findFirst();
    } else {
      res =
          await isar.phraseIsars.filter().traditionalEqualTo(text).findFirst();
    }

    if (res == null) {
      return Future.error('No phrase found.');
    }

    // check if fulfill length requirements
    if (PhraseChecks.getPhraseLength(res) < MIN_PHRASE_LENGTH) {
      return Future.error('Phrase not long enough.');
    }

    // check if any words overlap
    if (PhraseChecks.isWordsOverlap([res, gameState.previous])) {
      return Future.error('Word repeated from previous phrase.');
    }

    // check if fulfill pinyin requirements
    if (!PhraseChecks.isPinyinOverlap([res, gameState.previous])) {
      return Future.error('Pinyin not matching.');
    }

    return gameState.copyWith(
        previous: res,
        score: gameState.score + PhraseChecks.calcScoreToAdd(res),
        error: null);
  }

  /// Return a copy of gamestate with a random phrase
  Future<GameState> getRandom(GameState gameState) async {
    final isar = await db;
    final count = await isar.phraseIsars.count();
    int id = next(1, count + 1);
    PhraseIsar? pi = await isar.phraseIsars.get(id);
    return gameState.copyWith(previous: pi);
  }

  /// Generates a positive random integer uniformly distributed on the range
  /// from [min], inclusive, to [max], exclusive.
  int next(int min, int max) => min + _random.nextInt(max - min);

  ///
  /// All methods below are for init purposes
  ///

  /// Save phrase into db
  Future<void> savePhraseItem(PhraseIsar newPhraseItem) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.phraseIsars.putSync(newPhraseItem));
  }

  /// Load all phrases from json into db if not already there
  /// If already there do nothing
  Future<void> initializeDb() async {
    final isar = await db;
    final count = await isar.phraseIsars.count();

    if (count == 0) {
      final String response =
      await rootBundle.loadString('assets/dict/cedict.json');
      final data = await json.decode(response);

      for (var phrase in data) {
        PhraseIsar newPhrase = PhraseIsar.fromJson(phrase);
        isar.writeTxnSync<int>(() => isar.phraseIsars.putSync(newPhrase));
      }
    }
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PhraseIsarSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> clearDb() async {
    final isar = await db;
    await isar.close(deleteFromDisk: true);
  }
}
