import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_project/models/api_model.dart';

class PlayerApiProvider{
  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";

  final successCode = 200;

  Future<List<Players>>fetchPlayersByCountry(String countryId) async{
    final response = await http.get("$baseUrl+country=$countryId");
    final responseString = jsonDecode(response.body);
    
    if(response.statusCode == successCode){
      return ApiResult.fromJson(responseString).items;
    }
    else{
      throw Exception("failed to load players");
    }
  }


}//class ends here