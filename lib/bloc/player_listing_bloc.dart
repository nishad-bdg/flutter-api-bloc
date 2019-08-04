import 'package:bloc/bloc.dart';
import 'package:my_project/bloc/player_listing_events.dart';
import 'package:my_project/bloc/player_listing_state.dart';
import 'package:my_project/models/api_model.dart';
import 'package:my_project/services/repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  @override
  PlayerListingState get initialState => PlayerUnInitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayersEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      } catch (_) {
        yield PlayersErrorState();
      }
    }
  }
}
