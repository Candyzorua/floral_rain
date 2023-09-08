
import 'package:floral_rain/entities/phrase_isar.dart';
import 'package:floral_rain/helpers/phrase_checks.dart';
import 'package:floral_rain/services/isar_service.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:test/test.dart';

PhraseIsar testPhraseItem = PhraseIsar(
    definitions: ["testdef", "testdef2"],
    simplified: '美',
    traditional: '美',
    pinyin: 'měi');

PhraseIsar testPhraseItem2 = PhraseIsar(
    definitions: ["testdef", "testdef2"],
    simplified: '美妙',
    traditional: '美妙',
    pinyin: 'měi miào');

PhraseIsar testPhraseItem3 = PhraseIsar(
    definitions: ["testdef", "testdef2"],
    simplified: '皱眉',
    traditional: '皱眉',
    pinyin: 'zhòu méi');

PhraseIsar testPhraseItem4 = PhraseIsar(
    definitions: ["testdef", "testdef2"],
    simplified: '庙堂',
    traditional: '庙堂',
    pinyin: 'miào táng');

GameState initialGameState = GameState(previous: testPhraseItem, score: 0, error: null);

void main() {
  final isarService = IsarService();

  test('getPhrase should return correct value', () async {
    GameState result = await isarService.getPhraseItem("每天", "simplified", initialGameState);
    expect(result.score, 4);
  });

  test('getPhrase should return null', () async {
    try {
      await isarService.getPhraseItem(
          "test", "simplified", initialGameState);
      fail('expected error');
    } catch(e) {
      // pass
    }
  });

  test('game state should be updated', () async {
    try {
      GameState newGameState = await isarService.getRandom(initialGameState);
      expect(newGameState.previous.simplified != initialGameState.previous.simplified, true);
    } catch(e) {
      fail("should not have error");
    }
  });

  test('pinyin should overlap', () async {
    expect(PhraseChecks.isPinyinOverlap([testPhraseItem, testPhraseItem2]), true);
  });

  test('pinyin should not overlap', () async {
    expect(PhraseChecks.isPinyinOverlap([testPhraseItem2, testPhraseItem3]), false);
  });

  test('words should overlap', () async {
    expect(PhraseChecks.isWordsOverlap([testPhraseItem, testPhraseItem2]), true);
  });

  test('words should not overlap', () async {
    expect(PhraseChecks.isWordsOverlap([testPhraseItem2, testPhraseItem3]), false);
  });
}