import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/player_listing_bloc.dart';
import 'package:my_project/pages/player_listing.dart';
import 'package:my_project/services/repository.dart';
import 'package:my_project/themes/themes.dart';
import 'package:my_project/widgets/horizontal_bar.dart';
import 'package:my_project/widgets/search_bar.dart';



class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;

  @override
  void initState() {
    super.initState();
    _playerListingBloc =
        PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _playerListingBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Football Players',
            style: appBarTextStyle,
          ),
        ),
        body: Column(
          children: <Widget>[
            HorizontalBar(),
            SizedBox(height: 10.0),
            SearchBar(),
            SizedBox(height: 10.0),
            PlayerListing()
          ],
        ),
      ),
    );
  }
}
