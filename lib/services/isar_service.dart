import 'dart:convert';
import 'dart:math';

import 'package:floral_rain/entities/phrase_isar.dart';
import 'package:floral_rain/entities/stats_isar.dart';
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

  /**
   * PHRASES
   */

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

    // check if have used phrase before
    if (PhraseChecks.hasUsedWordsBefore(res, gameState.wordList, type)) {
      return Future.error('Phrase repeated.');
    }

    // update game state
    List<String> newWordList = [...gameState.wordList];
    if (type == "simplified") {
      newWordList.add(res.simplified);
    } else {
      newWordList.add(res.traditional);
    }

    return gameState.copyWith(
        wordList: newWordList,
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

  /**
   * STATS
   */

  /// Get a stream for the stat corresponding to the given index
  Future<Stream<StatsIsar?>> getStatStream(int id) async {
    final isar = await db;
    return isar.statsIsars.watchObject(id, fireImmediately: true);
  }

  /// Update stats
  Future<void> updateStats(int score, String longestOfTheRound) async {
    final isar = await db;
    isar.writeTxn(() async {

      // update highest score
      StatsIsar? highestScore = await isar.statsIsars.get(1);
      int highestScoreInt = int.parse(highestScore!.strValue!);

      if (score > highestScoreInt) {
        highestScore.strValue = score.toString();
        await isar.statsIsars.put(highestScore);
      }

      // update longest word
      StatsIsar? longestWord = await isar.statsIsars.get(2);

      if (longestOfTheRound.length > longestWord!.strValue!.length) {
        longestWord.strValue = longestOfTheRound;
        await isar.statsIsars.put(longestWord);
      }

      // update number of rounds
      StatsIsar? roundsPlayed = await isar.statsIsars.get(3);
      int roundsPlayedInt = int.parse(roundsPlayed!.strValue!);
      roundsPlayed.strValue = (roundsPlayedInt + 1).toString();
      await isar.statsIsars.put(roundsPlayed);

    });
  }

  ///
  /// All methods below are for init purposes
  ///

  /// Save phrase into db
  Future<void> savePhraseItem(PhraseIsar newPhraseItem) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.phraseIsars.putSync(newPhraseItem));
  }

  /// Load all phrases from json into db if not already there
  /// Initialize stats to none if not already there
  /// If already there do nothing
  Future<void> initializeDb() async {
    final isar = await db;
    final phraseCount = await isar.phraseIsars.count();

    if (phraseCount == 0) {
      final String response =
      await rootBundle.loadString('assets/dict/cedict.json');
      final data = await json.decode(response);

      for (var phrase in data) {
        PhraseIsar newPhrase = PhraseIsar.fromJson(phrase);
        isar.writeTxnSync<int>(() => isar.phraseIsars.putSync(newPhrase));
      }
    }

    final statsCount = await isar.statsIsars.count();
    if (statsCount == 0) {
      for (var stat in STATS_CATEGORIES) {
        StatsIsar newStat;
        if (stat == "longest_word") {
          newStat = StatsIsar(name: stat, strValue: '-');
        } else {
          newStat = StatsIsar(name: stat, strValue: '0');
        }
        isar.writeTxnSync<int>(() => isar.statsIsars.putSync(newStat));
      }
    }
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PhraseIsarSchema, StatsIsarSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> clearDb() async {
    final isar = await db;
    await isar.close(deleteFromDisk: true);
  }
}
