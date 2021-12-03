import '../routes/app_pages.dart';
import 'package:cash_book/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        theme: appThemeData,
        title: "App",
        initialRoute: AppPage.INITIAL,
        getPages: AppPage.routes,
      ),
    );
