import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:game/game/maps/map.dart';
import 'package:get/get.dart';

import 'actors/player.dart';

class MainGame extends Forge2DGame with VerticalDragDetector, TapDetector{

  @override
  Color backgroundColor()=>Colors.white;

  MapLevel map=MapLevel();

  late Vector2 gameSize;


  late Player player;


  addPlayer(Player player){
    this.player=player;
    add(player);
  }


  @override
  void onTapDown(TapDownInfo info) {
    double direction=0;
    if(info.raw.localPosition.dx>canvasSize.x/2){
      player.moveRight=true;
    }else {
      player.moveLeft=true;
    }
    
    super.onTapDown(info);
  }


  @override
  void onVerticalDragEnd(DragEndInfo info) {
    print(info.raw.velocity.pixelsPerSecond.dy);
    if (info.raw.velocity.pixelsPerSecond.dy < -500) {
      player.body.applyLinearImpulse(Vector2(0, -200));
    }
    super.onVerticalDragEnd(info);
  }

  @override void onTapUp(TapUpInfo info) {
    player.moveLeft=false;
    player.moveRight=false;
    super.onTapUp(info);
  }


  @override
  void onTapCancel() {
    player.moveLeft=false;
    player.moveRight=false;
    super.onTapCancel();
  }


  @override
  FutureOr<void> onLoad() async{
    
    //camera.viewport=FixedResolutionViewport(Vector2(340, Get.height));
    camera.zoom=11;

    gameSize=screenToWorld(camera.viewport.effectiveSize);

    add(map);
    

    await super.onLoad();
  }
}