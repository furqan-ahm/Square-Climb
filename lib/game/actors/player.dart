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
  bool get renderBody => false;

  bool moveLeft=false;
  bool moveRight=false;


  bool jumping=false;


  @override
  void update(double dt) {
    
    if(moveLeft){
      body.linearVelocity=Vector2(-5, body.linearVelocity.y);
    }

    if(moveRight){
      body.linearVelocity=Vector2(5, body.linearVelocity.y);
    }
    super.update(dt);
  }

  @override
  Future<void> onLoad() async{ 
    SpriteComponent sprite=SpriteComponent()..size=size..sprite=await game.loadSprite('square.png')..anchor=Anchor.center;
    add(sprite);
    return super.onLoad();
  }


  @override
  Body createBody() {
    Shape shape=PolygonShape()..setAsBoxXY(size.x/2, size.y/2);
    BodyDef bodyDef= BodyDef(position: position+Vector2(size.x/2, 0), type: BodyType.dynamic, userData: this)..fixedRotation=true;
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0.3, density: 1, restitution: 0,);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}