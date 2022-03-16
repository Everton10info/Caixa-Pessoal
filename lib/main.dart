
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() async => runApp (GetMaterialApp(
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
          headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind',fontWeight:FontWeight.w400),
        ),
      ),
      title: "App",
      initialRoute: AppPage.INITIAL,
      getPages: AppPage.routes,
    ));
     

 
   