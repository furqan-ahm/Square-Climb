import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game/game/actors/player.dart';
import 'package:game/game/components/flood.dart';
import 'package:game/game/components/platform.dart';
import 'package:game/game/mainGame.dart';

class MapLevel extends Component with HasGameRef<MainGame>{

  MapLevel():super();


  late Vector2 mapSize;

  @override
  FutureOr<void> onLoad() async{
    TiledComponent map=await TiledComponent.load('map.tmx', Vector2.all(32)/10, priority: 20);
    add(map);
    mapSize=map.scaledSize;
    //game.camera.followVector2(Vector2(map.scaledSize.x/2, map.scaledSize.y/1.09));
    


    final spawnLayer=map.tileMap.getLayer<ObjectGroup>('Spawn');

    final platformLayer=map.tileMap.getLayer<ObjectGroup>('Platform');


    for(final platform in platformLayer!.objects){
      game.add(Platform(position: Vector2(platform.x/10, platform.y/10), size: Vector2(platform.width/10, platform.height/10), touchable: platform.class_=='Steppable'));
    }


    final flood=Flood(position: Vector2(map.scaledSize.x/2,map.scaledSize.y+10), size: Vector2(game.canvasSize.x/10, map.scaledSize.x*32/9));
    game.add(flood);
    game.flood=flood;



    for(final spawn in spawnLayer!.objects){
      if(spawn.class_=='Player'){
        game.addPlayer(Player(position: Vector2(spawn.x/10,spawn.y/10), size: Vector2(spawn.width/10, spawn.height/10)));
      }
    }

    
    


    return super.onLoad();
  }

}