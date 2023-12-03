import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './screens/home_page.dart';

import './helper/init.dart' as di;
import './controller/api_controller.dart';

void main() async {
  await di.initDep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<ApiController>(builder: (apiController) {
          return GetMaterialApp(
            title: 'Flutter Video Player',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(),
            routes: {
              HomePage.routeName: (context) => const HomePage(),
            },
          );
        });
      },
    );
  }
}
