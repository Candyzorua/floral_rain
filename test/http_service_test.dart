
import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/services/http_service.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:test/test.dart';

const PhraseItem testPhraseItem = PhraseItem(
    definitions: ["testdef", "testdef2"],
    simplified: '美',
    traditional: '美',
    pinyin: 'měi',
    id: 'test');

const PhraseItem testPhraseItem2 = PhraseItem(
    definitions: ["testdef", "testdef2"],
    simplified: '美妙',
    traditional: '美妙',
    pinyin: 'měi miào',
    id: 'test');

const PhraseItem testPhraseItem3 = PhraseItem(
    definitions: ["testdef", "testdef2"],
    simplified: '皱眉',
    traditional: '皱眉',
    pinyin: 'zhòu méi',
    id: 'test');

const PhraseItem testPhraseItem4 = PhraseItem(
    definitions: ["testdef", "testdef2"],
    simplified: '庙堂',
    traditional: '庙堂',
    pinyin: 'miào táng',
    id: 'test');

const GameState initialGameState = GameState(previous: testPhraseItem, score: 0, error: null);

void main() {
  final httpService = HttpService();

  test('getPhrase should return correct value', () async {
    GameState result = await httpService.getPhraseItem("美妙", "simplified", initialGameState);
    expect(result.score, 1);
  });

  test('getPhrase should return null', () async {
    try {
      await httpService.getPhraseItem(
          "test", "simplified", initialGameState);
      fail('expected error');
    } catch(e) {
      // pass
    }
  });

  test('getPinyinOfFirstWord should return correct value', () async {
    expect(httpService.getPinyinOfFirstWord(testPhraseItem), "měi");
    expect(httpService.getPinyinOfFirstWord(testPhraseItem2), "měi");
    expect(httpService.getPinyinOfFirstWord(testPhraseItem3), "zhòu");
  });

  test('pinyin should match', () async {
    expect(httpService.getPinyinOfFirstWord(testPhraseItem4), httpService.getPinyinOfLastWord(testPhraseItem2));
  });

  test('game state should be updated', () async {
    try {
      GameState newGameState = await httpService.getRandom(
          "simplified", initialGameState);
      expect(newGameState.previous.simplified != initialGameState.previous.simplified, true);
    } catch(e) {
      fail("should not have error");
    }
  });
}