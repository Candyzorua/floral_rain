import 'package:flutter/cupertino.dart';
import '../entities/phrase_isar.dart';

@immutable
class GameState {
  final PhraseIsar previous;
  final int score;
  final Object? error;
  final bool? stopTimer; // required for stopping timer when user exits prematurely
  final List<String> wordList;

  const GameState({required this.previous, required this.score, required this.error, this.stopTimer, required this.wordList});

  // Since GameState is immutable, this method allows cloning with different content
  GameState copyWith({PhraseIsar? previous, int? score, Object? error, bool? stopTimer, List<String>? wordList}) {
    return GameState(
      previous: previous ?? this.previous,
      score: score ?? this.score,
      error: error,
      stopTimer: stopTimer ?? false,
      wordList: wordList ?? this.wordList
    );
  }
}