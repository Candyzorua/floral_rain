import 'package:floral_rain/state/game_state.dart';
import 'package:flutter/material.dart';
import 'entities/phrase_isar.dart';
import 'entities/rules.dart';

// background color for entire app
Color BGCOLOR = Colors.white;
Color BOTTOM_SHEET_COLOR = Colors.white;
Color? STANDARD_GREY = Colors.grey[100];
Color STANDARD_GREEN = Colors.green;
Color STANDARD_PINK = Colors.pink;

// navbar text styles
TextStyle BOTTOM_NAVBAR_STYLE =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'ZenKakuGothicAntique');

// game start page text styles
TextStyle START_GAME_SMALL_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle START_GAME_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');


TextStyle STATS_TITLE_TEXT_STYLE =
const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle STATS_SUBTITLE_TEXT_STYLE =
const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');

// game page text styles
TextStyle GAME_PREVIOUS_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique', color: Colors.pink);
TextStyle GAME_CURRENT_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique', color: Colors.green);
TextStyle GAME_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');
TextStyle GAME_ERROR_TEXT_STYLE =
TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique', color: Colors.red[900]);
TextStyle GAME_LIGHT_TEXT_STYLE =
TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique', color: Colors.grey[800]);
TextStyle GAME_PINYIN_TEXT_STYLE =
TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey[800]);

// game over page text styles
TextStyle GAME_OVER_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique', color: Colors.white);
TextStyle GAME_OVER_LIGHT_TEXT_STYLE =
const TextStyle(fontSize: 23, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique', color: Colors.white);

PhraseIsar INITIAL_PHRASE_ITEM = PhraseIsar(definitions: [], simplified: "", traditional: "", pinyin: "");
GameState INITIAL_GAME_STATE = GameState(previous: INITIAL_PHRASE_ITEM, score: 0, error: null, wordList: const []);

// game settings
const MIN_PHRASE_LENGTH = 2;
const TIME_LIMIT_SECONDS = 20;

/// STATS
// stats
const STATS_CATEGORIES = ['highest_score', 'longest_word', 'rounds_played'];

// stats page text styles
TextStyle STATS_SMALL_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle STATS_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');

/// RULES
// rules
Rules CHAIN_PHRASE_RULE = Rules(title: 'Chain phrases', body: 'Submit a phrase with at least one character with repeated pinyin from the previous phrase to reset the timer.', images: ['assets/rules/fr_example_chain.png']);
Rules LONGER_IS_BETTER_RULE = Rules(title: 'Longer is better', body: 'Longer phrases score more points! One-word phrases are disallowed.', images: ['assets/rules/fr_example_too_short.png']);
Rules DRY_RULE = Rules(title: 'D.R.Y.', body: "Don't repeat characters from the previous phrase, and don't use exact phrases you've already used!", images: ['assets/rules/fr_example_dry.png', 'assets/rules/fr_example_dry_word.png']);

// rules page text styles
TextStyle RULES_SMALL_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle RULES_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');
TextStyle RULES_TITLE_TEXT_STYLE =
const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');