# Floral Rain

A Mandarin word game for Android and iOS designed to help Mandarin learners grow their vocabulary and improve their pinyin in a fun way.

Players chain phrases containing different words with identical pinyin to score points alongside a ticking timer. Successfully submitting a phrase refreshes the timer. To make things exciting, longer phrases grant more points!

Repo for the currently unused backend API [here](https://github.com/Candyzorua/translator-server).

## Core Libraries

- [Flutter](https://flutter.dev/), frontend
- [Riverpod](https://riverpod.dev/), state management
- [Isar](https://pub.dev/packages/isar), local NoSQL database


## Visuals

#### Gameplay demos
Taken using the iPhone 14 simulator.

##### All features
https://github.com/Candyzorua/floral_rain/assets/75513525/7537434f-77ec-4e11-9b87-d46cda62233b

##### Main gameplay
https://github.com/Candyzorua/floral_rain/assets/75513525/f2b3fe44-b0d0-4241-b82a-2079cdf88a70

#### Start Game Page
<p float="left">
  <img src="demos/demo_image_start_game.png" width="100" />
</p>

#### Stats Page
<p float="left">
  <img src="demos/demo_image_stats_page.png" width="100" />
</p>

#### In-game Page
<p float="left">
  <img src="demos/demo_image_in_game_keyboard.png" width="100" />
  <img src="demos/demo_image_in_game_pinyin_not_matching.png" width="100" />
  <img src="demos/demo_image_in_game_word_repeated.png" width="100" />
</p>

#### Game Over Page
<p float="left">
  <img src="demos/demo_image_game_over.png" width="100" />
</p>

## Installation
```
flutter run 
```
- Working on uploading the app to TestFlight/Google Play Store. 

## Progress Log

#### Completed
- [12/9/2023] Completed v1.0.0. Implemented stats page, rules page, data persistence for all pages. Tested on iOS and Android physical devices.
- [24/8/2023] Completed main gameplay functionality. Data persistence is not implemented, mock data is being used in stats page.
- [8/9/2023] Moved backend to Isar after trying out Google Firebase and Express+MongoDB backends.

#### In Progress
- Deploy to TestFlight/Google Play Store.
- Implement settings page and allow users to adjust time limit etc.
- Write pinyin parsing Dart library.

## Attributions
- Sakura bridge image from **Yuliya Pauliukevich** on Vecteezy.
- Falling sakura flowers image from **Freepik**.
- Chinese dictionary data from [CC-CEDICT](https://www.mdbg.net/chinese/dictionary?page=cedict).



