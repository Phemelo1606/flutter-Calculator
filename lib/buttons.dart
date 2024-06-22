import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key,this.color,required this.buttontext,this.textcolor,this.buttonTapped});

  final color;
  final textcolor;
  final String buttontext;
  final buttonTapped;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(20),
          child: Container(
            
            color: color,
            child: Center(child: Text(buttontext, style: TextStyle(color: textcolor),),),
          ),
        ),
      ),
    );
  }
}

  