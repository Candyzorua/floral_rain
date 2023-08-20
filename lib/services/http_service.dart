import 'dart:convert';
import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:http/http.dart';

class HttpService {
  final String webServiceURL = "localhost:3000";
  final getPhraseItemPath = "/v1/translation/translateText";

  /*
  Returns the updated GameState. Throws error if word phrase does not exist
   */
  Future<GameState> getPhraseItem(String text, String type, GameState gameState) async {
    Map<String, String> queryParams = {'text': text, 'type': type};

    Response res =
        await get(Uri.http(webServiceURL, getPhraseItemPath, queryParams));

    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        dynamic body = jsonDecode(res.body);
        PhraseItem phraseItem = PhraseItem.fromJson(body);
        return gameState.copyWith(previous: phraseItem, score: gameState.score + 1, isInvalidPhrase: false);
      } else {
        return Future.error('No word with matching parameters found.');
      }
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
