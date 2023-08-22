import 'package:floral_rain/models/phrase_item.dart';
import 'package:flutter/cupertino.dart';

@immutable
class GameState {
  final PhraseItem previous;
  final int score;
  final Object? error;
  final bool? stopTimer; // required for stopping timer when user exits prematurely

  const GameState({required this.previous, required this.score, required this.error, this.stopTimer});

  // Since GameState is immutable, this method allows cloning with different content
  GameState copyWith({PhraseItem? previous, int? score, Object? error, bool? stopTimer}) {
    return GameState(
      previous: previous ?? this.previous,
      score: score ?? this.score,
      error: error,
      stopTimer: stopTimer ?? false
    );
  }
}