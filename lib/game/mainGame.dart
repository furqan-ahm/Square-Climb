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
    if(info.raw.localPosition.dx>canvasSize.x/2){
      player.moveRight=true;
      player.body.linearVelocity= Vector2(8, player.body.linearVelocity.y);
    }else {
      player.moveLeft=true;
      player.body.linearVelocity= Vector2(-8, player.body.linearVelocity.y);
      
    }
    
    super.onTapDown(info);
  }


  @override
  void onVerticalDragEnd(DragEndInfo info) {
    if (info.raw.velocity.pixelsPerSecond.dy < -500) {
      if(player.grounded)player.body.applyLinearImpulse(Vector2(0, -200));
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