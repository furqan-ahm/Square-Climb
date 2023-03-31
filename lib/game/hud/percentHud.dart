import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game/controllers/game_controller.dart';
import 'package:get/get.dart';

import '../mainGame.dart';

class Hud extends Component with HasGameRef<MainGame> {
  Hud({super.children, super.priority});


  late TextComponent scoreTextComponent;


  GameController get controller=>Get.find<GameController>();

  @override
  Future<void>? onLoad() async{
    scoreTextComponent = TextComponent(
        text: '${controller.globalScore.value}%',
        position: Vector2(game.gameSize.x/2,20),
        anchor: Anchor.center,
        scale: Vector2(1, 1) / 5,
        textRenderer: TextPaint(style: TextStyle(color: Colors.blue.withOpacity(0.44), fontSize: 30))
        );

    controller.globalScore.listen((val) {
      scoreTextComponent.text='$val%';
    });
    

    add(scoreTextComponent);
    return super.onLoad();
  }


  @override
  void update(double dt) {
    scoreTextComponent.position=game.camera.position+game.canvasSize/20;
    super.update(dt);
  }
}