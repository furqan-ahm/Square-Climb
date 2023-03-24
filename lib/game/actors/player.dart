import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:game/game/mainGame.dart';

class Player extends BodyComponent<MainGame>{

  Player({
    required this.position,
    required this.size,
  });


  Vector2 position;
  Vector2 size;





  @override
  Future<void> onLoad() async{ 
    SpriteComponent sprite=SpriteComponent()..size=size..sprite=await game.loadSprite('square.png');
    return super.onLoad();
  }


  @override
  Body createBody() {
    
    throw UnimplementedError();
  }

}