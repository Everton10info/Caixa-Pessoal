

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashView extends StatelessWidget {
  
  @override
   
  Widget build(BuildContext context) {
    return Scaffold(
  
    body: AnimatedSplashScreen(
  
     
            duration: 1600,
            splash: Image(image:AssetImage('assets/images/background.png') ),
            nextScreen:MyHome(),          
            splashTransition: SplashTransition.rotationTransition,
            splashIconSize: 115.5,
        ));}
}

