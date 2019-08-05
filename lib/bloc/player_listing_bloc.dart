import 'package:bloc/bloc.dart';
import 'package:my_project/bloc/player_listing_events.dart';
import 'package:my_project/bloc/player_listing_state.dart';
import 'package:my_project/models/api_model.dart';
import 'package:my_project/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

 @override
  Stream<PlayerListingState> transform(Stream<PlayerListingEvent> events, Stream<PlayerListingState> Function(PlayerListingEvent event) next) {
    return super.transform((events as PublishSubject<PlayerListingEvent>)
    .debounceTime(Duration(milliseconds:250)),
      next
    );
  }

  @override
  void onTransition(Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  PlayerListingState get initialState => PlayerUnInitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    print("mapEventToState");
    yield PlayerFetchingState();
    try {
      List<Players> players;
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      }

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
