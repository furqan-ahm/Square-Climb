import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:game/game/maps/map.dart';
import 'package:get/get.dart';

class MainGame extends Forge2DGame{

  @override
  Color backgroundColor()=>Colors.white;

  MapLevel map=MapLevel();

  @override
  FutureOr<void> onLoad() async{
    
    //camera.viewport=FixedResolutionViewport(Vector2(330, Get.size.height));
    camera.zoom=10;

    add(map);

    return super.onLoad();
  }
}