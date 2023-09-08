// import 'dart:convert';
// import 'package:floral_rain/const.dart';
// import 'package:floral_rain/models/phrase_item.dart';
// import 'package:floral_rain/state/game_state.dart';
// import 'package:http/http.dart';
//
// class HttpService {
//   final String webServiceURL = "localhost:3000";
//   final getPhraseItemPath = "/v1/translation/translateText";
//   final getRandomPath = "/v1/translation/getRandom";
//
//   /// Checks the phrase and returns the updated GameState.
//   /// Throws error if word phrase does not exist
//   /// or if pinyin does not match
//   Future<GameState> getPhraseItem(
//       String text, String type, GameState gameState) async {
//     Map<String, String> queryParams = {'text': text, 'type': type};
//
//     Response res =
//         await get(Uri.http(webServiceURL, getPhraseItemPath, queryParams));
//
//     if (res.statusCode == 200) {
//
//       // check if phrase exists in database
//       if (res.body.isEmpty) {
//         return Future.error('No phrase found.');
//       }
//
//       // parse json
//       dynamic body = jsonDecode(res.body);
//       PhraseItem phraseItem = PhraseItem.fromJson(body);
//
//       // check if fulfill length requirements
//       if (getPhraseLength(phraseItem) < MIN_PHRASE_LENGTH) {
//         return Future.error('Phrase not long enough.');
//       }
//
//       // check if any words overlap
//       if (isWordsOverlap([phraseItem, gameState.previous])) {
//         return Future.error('Word repeated from previous phrase.');
//       }
//
//       // check if fulfill pinyin requirements
//       if (!isPinyinOverlap([phraseItem, gameState.previous])) {
//         return Future.error('Pinyin not matching.');
//       }
//
//       return gameState.copyWith(
//           previous: phraseItem,
//           score: gameState.score + calcScoreToAdd(phraseItem),
//           error: null);
//
//     } else {
//       throw "Unknown error.";
//     }
//   }
//
//   /// Gets a random phrase and returns the updated GameState.
//   Future<GameState> getRandom(String type, GameState gameState) async {
//     Map<String, String> queryParams = {'type': type};
//
//     Response res =
//         await get(Uri.http(webServiceURL, getRandomPath, queryParams));
//
//     if (res.statusCode == 200) {
//       dynamic body = jsonDecode(res.body);
//       PhraseItem phraseItem = PhraseItem.fromJson(body);
//       return gameState.copyWith(previous: phraseItem);
//     } else {
//       throw "Unknown error.";
//     }
//   }
//
//   /// Helper for indicating if two phrase items have at least one word with same pinyin
//   bool isPinyinOverlap(List<PhraseItem> piList) {
//     Iterable<List<String>> lists =
//         piList.map((pi) => pi.pinyin.toLowerCase().split(' '));
//     final commonElements = lists.fold<Set>(
//         lists.first.toSet(), (a, b) => a.intersection(b.toSet()));
//     return commonElements.isNotEmpty;
//   }
//
//   /// Helper for indicating if two phrase items share at least one word
//   bool isWordsOverlap(List<PhraseItem> piList) {
//     Iterable<List<String>> lists =
//     piList.map((pi) => pi.simplified.split(''));
//     final commonElements = lists.fold<Set>(
//         lists.first.toSet(), (a, b) => a.intersection(b.toSet()));
//     return commonElements.isNotEmpty;
//   }
//
//   /// Helper for getting phrase length
//   int getPhraseLength(PhraseItem pi) {
//     List<String> pinyinList = pi.pinyin.split(' ');
//     return pinyinList.length;
//   }
//
//   /// Helper to calculate score to add based on phrase length
//   int calcScoreToAdd(PhraseItem pi) {
//     int phraseLength = getPhraseLength(pi);
//     return phraseLength * phraseLength;
//   }
// }
