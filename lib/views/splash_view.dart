

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';



class SplashView extends StatelessWidget {


   
  Widget build(BuildContext context) {
    return Material(
  
   child: AnimatedSplashScreen(
  
     
            duration: 1000,
            splash: Image(image:AssetImage('assets/images/background.png') ),
            nextScreen:Home(),          
            splashTransition: SplashTransition.rotationTransition,
            splashIconSize: 115.5,
            pageTransitionType: PageTransitionType.leftToRight,
         
        ));}
}

