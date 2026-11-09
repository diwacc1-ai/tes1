import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      initialRoute: Routes.login,
      getPages: Routes.myPages,
    );
  }
}