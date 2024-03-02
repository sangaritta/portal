import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter/material.dart';
import 'package:portal/Screens/Login/register_screen.dart';

class RainbowButton extends StatefulWidget {
  const RainbowButton({super.key});

  @override
  State<RainbowButton> createState() => _RainbowButtonState();
}

class _RainbowButtonState extends State<RainbowButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,30,0,0),
      child: Animate(
        effects: [FadeEffect(), ScaleEffect()],
        child: ElevatedButton(
      child: Text("Register"),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (c){
            return RegisterScreen();
          })
        );
      },
      ),
      ),
    );
  }
}