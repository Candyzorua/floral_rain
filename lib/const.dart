import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:flutter/material.dart';

// background color for entire app
Color BGCOLOR = Colors.white;
Color BOTTOM_SHEET_COLOR = Colors.white;
Color? STANDARD_GREY = Colors.grey[100];
Color STANDARD_GREEN = Colors.green;

// navbar text styles
TextStyle BOTTOM_NAVBAR_STYLE =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'ZenKakuGothicAntique');

// game start page text styles
TextStyle START_GAME_SMALL_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle START_GAME_LARGE_TEXT_STYLE =
const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');

// stats page text styles
TextStyle STATS_SMALL_TEXT_STYLE =
const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique');
TextStyle STATS_LARGE_TEXT_STYLE =
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
const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'ZenKakuGothicAntique');
TextStyle GAME_ERROR_TEXT_STYLE =
TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'ZenKakuGothicAntique', color: Colors.red[900]);

PhraseItem testPhraseItem = const PhraseItem(definitions: ["test1", "test2"], simplified: "你", traditional: "你", pinyin: "test", id: "test");
GameState testGameState = GameState(previous: testPhraseItem, score: 0, isInvalidPhrase: true, isUnknownError: false);