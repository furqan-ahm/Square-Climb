import 'package:flutter/material.dart';
import 'package:game/controllers/game_controller.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class RecordsScreen extends GetView<GameController> {
  const RecordsScreen({Key? key}) : super(key: key);

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
                        fontFamily: 'Records'),
                  ),
                ),
              ),
              GetBuilder<GameController>(
                builder: (context) {
                  return Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ListView.builder(
                              itemCount: controller.scores.length,
                              itemBuilder: (context,index)=>Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text('YOU', style: TextStyle(fontSize: 24, color: Color(0xffF9AAA8)),),
                                    ),
                                    const Spacer(),
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text('${controller.scores[index]}%  ', style: const TextStyle(fontSize: 22, color: Colors.white, fontFamily: 'Kirang'),),
                                          Expanded(child: LinearProgressIndicator(color: Colors.red, value: int.parse(controller.scores[index])/100,))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: CustomButton(transparent: true,title: 'BACK', onPressed: (){Get.back();},),
                          )
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
