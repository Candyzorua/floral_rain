import 'dart:convert';
import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:http/http.dart';

class HttpService {
  final String webServiceURL = "localhost:3000";
  final getPhraseItemPath = "/v1/translation/translateText";
  final getRandomPath = "/v1/translation/getRandom";

  /// Checks the phrase and returns the updated GameState.
  /// Throws error if word phrase does not exist
  /// or if pinyin does not match
  Future<GameState> getPhraseItem(String text, String type, GameState gameState) async {
    Map<String, String> queryParams = {'text': text, 'type': type};

    Response res =
        await get(Uri.http(webServiceURL, getPhraseItemPath, queryParams));

    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        dynamic body = jsonDecode(res.body);
        PhraseItem phraseItem = PhraseItem.fromJson(body);
        if (isPinyinOverlap([phraseItem, gameState.previous])) {
          return gameState.copyWith(previous: phraseItem,
              score: gameState.score + 1,
              error: null);
        } else {
          return Future.error('Pinyin not matching.');
        }
      } else {
        return Future.error('No phrase found.');
      }
    } else {
      throw "Unknown error.";
    }
  }

  /// Gets a random phrase and returns the updated GameState.
  Future<GameState> getRandom(String type, GameState gameState) async {
    Map<String, String> queryParams = {'type': type};

    Response res =
    await get(Uri.http(webServiceURL, getRandomPath, queryParams));

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PhraseItem phraseItem = PhraseItem.fromJson(body);
      return gameState.copyWith(previous: phraseItem);
    } else {
      throw "Unknown error.";
    }
  }

  /// Helper for indicating if two phrase items have at least one word with same pinyin
  bool isPinyinOverlap(List<PhraseItem> piList) {
    Iterable<List<String>> lists = piList.map((pi) => pi.pinyin.toLowerCase().split(' '));
    final commonElements =
    lists.fold<Set>(
        lists.first.toSet(),
            (a, b) => a.intersection(b.toSet()));
    return commonElements.isNotEmpty;
  }
}