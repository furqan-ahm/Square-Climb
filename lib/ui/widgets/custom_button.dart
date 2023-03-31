import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
const CustomButton({ Key? key, this.onPressed, this.transparent=false, required this.title }) : super(key: key);

  final bool transparent;
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context){
    return Material(
      color: transparent?Colors.transparent:const Color(0xffBF2621),
      child: InkWell(
        onTap: (){
          if(onPressed!=null)onPressed!();
          FlameAudio.play('play.mp3');
        },
        child: SizedBox(
          width: 200,
          height: 55,
          child: Center(child: Text(title, style: const TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Kirang'),)),
        ),
      ),
    );
  }
}