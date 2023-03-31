import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/controllers/game_controller.dart';
import 'package:get/get.dart';
class GameScreen extends GetView<GameController> {
const GameScreen({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<GameController>(
            builder: (cont) {
              return Container(
                padding: const EdgeInsets.all(25),
                child: GameWidget(game: controller.game,),
              );
            }
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: (){
                controller.pause();
              },
              child: Container(
                color: Colors.red.withOpacity(0.8),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(2),
                child: const Icon(Icons.pause, color: Colors.white, size: 32,),
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff1E3264), width: 25)
              ),
            ),
          )
        ],
      ),
    );
  }
}