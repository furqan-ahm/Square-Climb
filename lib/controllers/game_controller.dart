import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:game/game/mainGame.dart';
import 'package:game/ui/screens/menu_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends GetxController {
  MainGame game = MainGame();

  SharedPreferences? instance;

  RxInt sound = 0.obs;
  RxInt music = 0.obs;

  RxInt globalScore = 0.obs;

  RxList<String> scores = <String>[].obs;

  String get highScore => scores.isEmpty
      ? '0'
      : scores.reduce((prev, el) {
          return int.parse(prev) > int.parse(el) ? prev : el;
        });

  restartGame() {
    globalScore.value = 0;
    game = MainGame();
    update();
  }

  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      instance = value;
      sound.value = instance!.getInt('sound') ?? 70;
      music.value = instance!.getInt('music') ?? 70;
      scores.value = instance!.getStringList('scores') ?? [];

      scores.listen((p0) {
        instance!.setStringList('scores', p0);
      });

      // music.listen((music) {
      //   if ((!FlameAudio.bgm.isPlaying)) {

      //     FlameAudio.bgm.play('bg.mp3', volume: music/100);
      //   }else{FlameAudio.bgm.audioPlayer.setVolume(music/100);}
      // });
      music.refresh();
    });
    super.onInit();
  }

  void gameOver({bool win=false}) {
    win?FlameAudio.play('complete.mp3'):FlameAudio.play('lose.mp3');
    game.pauseEngine();
    scores.add("$globalScore");
    scores.refresh();
    Get.generalDialog(
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation, secondaryAnimation) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: Get.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xff3957BC).withOpacity(.93),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'SCORE',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Kirang'),
                        ),
                        Text(
                          '$globalScore%',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Kirang'),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'HIGHSCORE',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Kirang'),
                        ),
                        Text(
                          '$highScore%',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Kirang'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Material(
                  color: const Color(0xffBF2621),
                  child: InkWell(
                    onTap: () {
                      restartGame();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        'RESTART',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Kirang'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Material(
                  color: const Color(0xffBF2621),
                  child: InkWell(
                    onTap: () {
                      Get.offAll(const MenuScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        'MENU',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Kirang'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pause() {
    game.pauseEngine();
    Get.generalDialog(
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation, secondaryAnimation) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: Get.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xff3957BC).withOpacity(.93),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'PAUSED',
                  style: TextStyle(
                      fontSize: 36, color: Colors.white, fontFamily: 'Kirang'),
                ),
                const SizedBox(height: 20),
                Material(
                  color: const Color(0xffBF2621),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        'RESUME',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Kirang'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Material(
                  color: const Color(0xffBF2621),
                  child: InkWell(
                    onTap: () {
                      restartGame();
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        'RESTART',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Kirang'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Material(
                  color: const Color(0xffBF2621),
                  child: InkWell(
                    onTap: () {
                      Get.offAll(const MenuScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        'MENU',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Kirang'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    game.resumeEngine();
  }



  playJumpSfx(){
    FlameAudio.play('jump.wav',volume: sound.value/100);
  }


  playGameOverSfx(){
    FlameAudio.play('lose.mp3',volume: sound.value/100);
  }

  playWinSfx(){
    FlameAudio.play('complete.mp3',volume: sound.value/100);
  }


}
