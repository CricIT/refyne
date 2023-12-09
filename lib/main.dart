import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refyne_task/app/my_strings.dart';
import 'app/dependency.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';

void main() {
  DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        title: MyStrings.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.LANDING_PAGE,
        getPages: Routes.getAllPages(),
        transitionDuration: const Duration(milliseconds: 500),
      );
  }
}




