import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/mainGame.dart';
class GameScreen extends StatelessWidget {
const GameScreen({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context){
    return GameWidget(game: MainGame(),);
  }
}