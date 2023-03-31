import 'package:flutter/material.dart';
import 'package:game/ui/screens/game_screen.dart';
import 'package:game/ui/screens/records_screen.dart';
import 'package:game/ui/screens/settings_screen.dart';
import 'package:get/get.dart';

import '../../controllers/game_controller.dart';
import '../widgets/custom_button.dart';

class MenuScreen extends GetView<GameController> {
  const MenuScreen({Key? key}) : super(key: key);

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
                  colors: [Color(0xff1E3264), Color(0xff041A3E)]),
            ),
            child: Image.asset(
              'assets/images/menu_texture.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
        Column(
          children: [
            const Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  'SQUARE.CLIM',
                  style: TextStyle(color: Colors.white, fontSize: 48, fontFamily: 'Kirang'),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'PLAY',
                    onPressed: () {
                      controller.restartGame();
                      Get.to(const GameScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'SETTINGS',
                    onPressed: (){
                      Get.to(const SettingsScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'RECORDS',
                    onPressed: (){
                      Get.to(const RecordsScreen());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
