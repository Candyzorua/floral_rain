import 'package:floral_rain/models/phrase_item.dart';
import 'package:flutter/cupertino.dart';

@immutable
class GameState {
  final PhraseItem previous;
  final int score;
  final bool isInvalidPhrase;
  final bool isUnknownError;

  const GameState({required this.previous, required this.score, required this.isInvalidPhrase, required this.isUnknownError});

  // Since GameState is immutable, this method allows cloning with different content
  GameState copyWith({PhraseItem? previous, int? score, bool? isInvalidPhrase, bool? isUnknownError}) {
    return GameState(
      previous: previous ?? this.previous,
      score: score ?? this.score,
      isInvalidPhrase: isInvalidPhrase ?? this.isInvalidPhrase,
      isUnknownError: isUnknownError ?? this.isUnknownError
    );
  }
}