import 'package:cash_book/theme/app_theme.dart';
import 'package:cash_book/views/cash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() => runApp(GetMaterialApp(
  theme: appThemeData,
  title:"App",
  getPages: [
    GetPage(name: '/' , page: ()=> Cash()),
  ],
  initialRoute: '/',
  
  
  ));



