import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Flood extends BodyComponent with ContactCallbacks{

  
  Flood({
    required this.position,
    required this.size,
  });


  Vector2 get topPosition=>body.position-size/2;

  
  Vector2 position;
  Vector2 size;



  @override
  Future<void> onLoad() async{
    SpriteComponent sprite = SpriteComponent()
      ..size = size
      ..sprite = await game.loadSprite('water.png')
      ..anchor = Anchor.center;
    add(sprite);

    Future.delayed(const Duration(seconds: 2),(){body.linearVelocity=Vector2(0, -2);});
    return super.onLoad();
  }



  @override
  void beginContact(Object other, Contact contact) {
    
    super.beginContact(other, contact);
  }

  
  @override
  // TODO: implement renderBody
  bool get renderBody => false;

  @override
  Body createBody() {
    Shape shape=PolygonShape()..setAsBoxXY(size.x/2, size.y/2);
    BodyDef bodyDef= BodyDef(position: position+Vector2(0, size.y/2), type: BodyType.dynamic, userData: this);
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0.8, density: 1, restitution: 0,isSensor: true);
    return world.createBody(bodyDef)..createFixture(fixtureDef)..gravityOverride=Vector2.zero();
  }

}