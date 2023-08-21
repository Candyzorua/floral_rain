// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:floral_rain/const.dart';
import 'package:floral_rain/services/http_service.dart';
import 'package:floral_rain/state/game_state.dart';
import 'package:riverpod/riverpod.dart';

class GameNotifier extends StateNotifier<AsyncValue<GameState>> {
  // initialize
  GameNotifier(): super(AsyncData(testGameState));

  final HttpService httpService = HttpService();
  late AsyncValue<GameState> prevGameState;

  // take a random word and put it into the game state
  Future<void> initialize() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => httpService.getRandom("simplified", testGameState));
  }

  // submit phrase
  Future<void> submitPhrase(String text, String type, GameState gs) async {
    try {
      // save the prev state
      prevGameState = state;

      // set state to `loading` before starting the asynchronous work
      state = const AsyncValue.loading();
      state = AsyncValue.data(await httpService.getPhraseItem(text, type, gs));
    } catch (e) {
      state = AsyncData(prevGameState.value!.copyWith(error: e));
    } finally {
      // pass
    }
  }
}

final gameNotifierProvider =
    StateNotifierProvider<GameNotifier, AsyncValue<GameState>>((ref) {
  return GameNotifier();
});
