import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routings/app_pages.dart';
import 'app/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(),
      ),
      initialBinding: ApiServiceBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
