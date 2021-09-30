// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resp_api_3/routes/app_pages.dart';
import 'package:resp_api_3/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}

