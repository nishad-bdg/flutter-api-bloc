import 'package:my_project/models/api_model.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingState{}

class PlayerUnInitializedState extends PlayerListingState{}

class PlayerFetchingState extends PlayerListingState {}

class PlayerFetchedState extends PlayerListingState {
  final List<Players> players;
  PlayerFetchedState({@required this.players}):assert(players != null);
}

class PlayersErrorState extends PlayerListingState {}

class PlayersEmptyState extends PlayerListingState {}


