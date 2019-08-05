import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/player_listing_bloc.dart';
import 'package:my_project/bloc/player_listing_events.dart';
import 'package:my_project/themes/themes.dart';
import 'package:my_project/themes/themes.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: TextField(
        onChanged: (term){
          print(term);
          BlocProvider.of<PlayerListingBloc>(context)
          .dispatch(SearchTextChangedEvent(searchTerm: term));
        },
        style:titleTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          hintStyle: hintStyle,
          hintText: 'Search for a player',
          prefixIcon: Icon(Icons.person, size: 30.0, color: Colors.black)

        ),
      ),
    );
  }
}