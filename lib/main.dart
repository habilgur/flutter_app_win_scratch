import 'package:flutter/material.dart';
import 'package:flutter_app_win_scratch/game_data.dart';
import 'package:flutter_app_win_scratch/the_body.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameData>(
      create: (context) => GameData(),
      child: MaterialApp(
        home: TheBody(),
      ),
    );
  }
}
