import 'package:floral_rain/models/phrase_item.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:flutter/material.dart';

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

PhraseItem testPhraseItem = const PhraseItem(definitions: ["test1", "test2"], simplified: "试", traditional: "试", pinyin: "shì", id: "test");
GameState testGameState = GameState(previous: testPhraseItem, score: 0, error: null);