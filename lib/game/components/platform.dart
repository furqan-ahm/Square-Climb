import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:game/controllers/game_controller.dart';
import 'package:get/get.dart';

import '../actors/player.dart';

class Platform extends BodyComponent with ContactCallbacks{


  Platform({
    required this.position,
    required this.size,
    required this.touchable,
  });


  
  Vector2 position;
  Vector2 size;
  bool touchable;


  @override
  Future<void> onLoad() {
    return super.onLoad();
  }


  GameController get controller=>Get.find<GameController>();


  @override
  void beginContact(Object other, Contact contact) {
    if(other is Player && !touchable){
      controller.gameOver();
    }
    super.beginContact(other, contact);
  }


  @override
  // TODO: implement renderBody
  bool get renderBody => false;

  @override
  Body createBody() {
    Shape shape=PolygonShape()..setAsBoxXY(size.x/2, size.y/2);
    BodyDef bodyDef= BodyDef(position: position+Vector2(size.x/2, size.y/2), type: BodyType.static, userData: this);
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0.8, density: 1, restitution: 0);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

}