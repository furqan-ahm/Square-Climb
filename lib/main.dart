import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/bindings/global.dart';
import 'package:game/ui/screens/menu_screen.dart';
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
      title: 'Square Clim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}
