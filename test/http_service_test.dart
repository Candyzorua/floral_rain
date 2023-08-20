
import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/services/http_service.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:test/test.dart';

const PhraseItem testPhraseItem = PhraseItem(
    definitions: ["testdef", "testdef2"],
    simplified: '试试',
    traditional: '试试',
    pinyin: 'test',
    id: 'test');

const GameState initialGameState = GameState(previous: testPhraseItem, score: 0, isInvalidPhrase: false, isUnknownError: false);

void main() {
  test('getPhrase should return correct value', () async {
    final httpService = HttpService();
    GameState result = await httpService.getPhraseItem("美妙", "simplified", initialGameState);
    expect(result.score, 1);
  });

  test('getPhrase should return null', () async {
    final httpService = HttpService();
    try {
      await httpService.getPhraseItem(
          "test", "simplified", initialGameState);
      fail('expected error');
    } catch(e) {
      // pass
    }
  });
}