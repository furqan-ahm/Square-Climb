import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/bindings/global.dart';
import 'package:game/ui/screens/game_screen.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  static final bindings=GlobalBindings();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: bindings,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}
