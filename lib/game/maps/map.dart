import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game/game/mainGame.dart';

class MapLevel extends Component with HasGameRef<MainGame>{


  @override
  FutureOr<void> onLoad() async{
    TiledComponent map=await TiledComponent.load('map.tmx', Vector2.all(32)/8);
    add(map);
    game.camera.followVector2(Vector2(map.scaledSize.x/2, map.scaledSize.y/1.09));
    

    final spawnLayer=map.tileMap.getLayer<ObjectGroup>('Spawn');

    for(final spawn in spawnLayer!.objects){
      if(spawn.class_=='Player'){
        
      }
    }

    return super.onLoad();
  }

}