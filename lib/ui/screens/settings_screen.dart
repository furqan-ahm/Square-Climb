import 'package:flame/cache.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/controllers/game_controller.dart';
import 'package:game/ui/widgets/custom_button.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  GameController get controller => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff1E3264), Color(0xff041A3E)]),
            ),
            child:Image.asset(
              'assets/images/background2.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Column(
            children: [
              const Flexible(
                flex: 2,
                child: Center(
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                        color: Color(0xffE6302A),
                        fontSize: 48,
                        fontFamily: 'Kirang'),
                  ),
                ),
              ),
              GetBuilder<GameController>(
                builder: (context) {
                  return Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('MUSIC VOLUME', style: TextStyle(fontSize: 24, color: Color(0xffF9AAA8), fontFamily: 'Kirang'),),
                          const SizedBox(
                            height: 20,
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              thumbShape: SliderComponentShape.noThumb,
                              activeTrackColor: const Color(0xffE6302A)
                            ),
                            child: Slider(
                              value: controller.music.value, 
                              onChanged: (val){
                                controller.music.value=val;
                                controller.update();
                              },
                              max: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('SOUND VOLUME', style: TextStyle(fontSize: 24, color: Color(0xffF9AAA8), fontFamily: 'Kirang'),),
                          SliderTheme(
                            data: SliderThemeData(
                              thumbShape: SliderComponentShape.noThumb,
                              activeTrackColor: const Color(0xffE6302A)
                            ),
                            child: Slider(
                              value: controller.sound.value, 
                              onChanged: (val){
                                controller.sound.value=val;
                                controller.update();
                              },
                              max: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(transparent: true,title: 'BACK', onPressed: (){Get.back();},)
                        ],
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ],
      ),
    );
  }
}
