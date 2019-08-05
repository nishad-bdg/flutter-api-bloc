import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_project/bloc/player_listing_bloc.dart';
import 'package:my_project/bloc/player_listing_state.dart';
import 'package:my_project/models/api_model.dart';
import 'package:my_project/themes/themes.dart';
import 'package:my_project/widgets/message.dart';

class PlayerListing extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<PlayerListingBloc>(context),
      builder: (context,state){
        if(state is PlayerUnInitializedState){
          return Message(message: "Please select a country flag to fetch players from");
        }
        else if(state is PlayersEmptyState){
          return Message(message: "No players found");
        }
        else if(state is PlayersErrorState){
          return Message(message:"Something is wrong");
        }
        else if(state is PlayerFetchingState){
          return Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        else {
          final stateAsPlayerFetchedState = state as PlayerFetchedState;
          final players = stateAsPlayerFetchedState.players;
          return buildPlayersList(players);
        }

      },
    );
  }

  Widget buildPlayersList(List<Players>players){
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index){
          var player = players[index];
          return ListTile(
            leading: Image.network(player.headshot.imgUrl, height: 70.0, width: 70.0,),
            title: Text(player.name, style: titleTextStyle),
            subtitle: Text(player.club.name, style: subTitleTextStyle),
          );
        },
        separatorBuilder: (BuildContext context, index){
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: players.length,


      )
    );

  }
}