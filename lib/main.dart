import 'package:cash_book/view_model/controllersList.dart';
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//import 'package:page_transition/page_transition.dart';
void main() async {
   
 Get.put(ListTrController(),permanent: true);
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
        
        headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.w600),
        headline6: TextStyle(
            fontSize: 18.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400),
      ),
    ),
   
    title: "App",
    initialRoute: AppPage.INITIAL,
    getPages: AppPage.routes,
  ));

            
}
