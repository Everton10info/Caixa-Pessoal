import 'package:cash_book/views/home.dart';

import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

//import 'package:page_transition/page_transition.dart';
void main() async {

  runApp(GetMaterialApp(

    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,

      // Define the default font family.
      fontFamily: 'Georgia',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        
        headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(
            fontSize: 24.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400),
      ),
    ),
   
    title: "App",
    initialRoute: AppPage.INITIAL,
    getPages: AppPage.routes,
  ));

            
}
