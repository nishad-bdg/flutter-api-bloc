import 'package:my_project/models/api_model.dart';
import 'package:my_project/services/player_api_provider.dart';

class PlayerRepository{
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) => 
    _playerApiProvider.fetchPlayersByCountry(countryId);
}