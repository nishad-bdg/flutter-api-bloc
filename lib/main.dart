import 'package:flutter/material.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:my_project/services/repository.dart';

void main(){
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(playerRepository: _repository));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;
  MyApp({this.playerRepository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Implementation',
      home: HomePage(playerRepository:playerRepository),
    );
  }
}
