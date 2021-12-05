import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
  
        title: "App",
        initialRoute: AppPage.INITIAL,
        getPages: AppPage.routes,
      ),
    );
