import '../entities/phrase_isar.dart';

class PhraseChecks {
  /// Helper for indicating if two phrase items have at least one word with same pinyin
  static bool isPinyinOverlap(List<PhraseIsar> piList) {
    Iterable<List<String>> lists =
    piList.map((pi) => pi.pinyin.toLowerCase().split(' '));
    final commonElements = lists.fold<Set>(
        lists.first.toSet(), (a, b) => a.intersection(b.toSet()));
    return commonElements.isNotEmpty;
  }

  /// Helper for indicating if two phrase items share at least one word
  static bool isWordsOverlap(List<PhraseIsar> piList) {
    Iterable<List<String>> lists =
    piList.map((pi) => pi.simplified.split(''));
    final commonElements = lists.fold<Set>(
        lists.first.toSet(), (a, b) => a.intersection(b.toSet()));
    return commonElements.isNotEmpty;
  }

  /// Helper for getting phrase length
  static int getPhraseLength(PhraseIsar pi) {
    List<String> pinyinList = pi.pinyin.split(' ');
    return pinyinList.length;
  }

  /// Helper to calculate score to add based on phrase length
  static int calcScoreToAdd(PhraseIsar pi) {
    int phraseLength = getPhraseLength(pi);
    return phraseLength * phraseLength;
  }

  /// Helper to determine if user has used word before
  static bool hasUsedWordsBefore(PhraseIsar pi, List<String> wordList, String mode) {
    if (mode == "simplified") {
      for (var w in wordList) {
        if (w == pi.simplified) {
          return true;
        }
      }
    } else {
      for (var w in wordList) {
        if (w == pi.traditional) {
          return true;
        }
      }
    }

    return false;
  }
}