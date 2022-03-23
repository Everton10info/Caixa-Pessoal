import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  Future.delayed(Duration(milliseconds: 500),(() =>  CircularProgressIndicator(color: Colors.blueGrey,backgroundColor: Colors.black,value: 1.0,)));
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
            fontFamily: 'Hind',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400),
      ),
    ),
    title: "App",
    initialRoute: AppPage.INITIAL,
    getPages: AppPage.routes,
  ));
}
