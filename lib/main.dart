import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/calculator_page.dart';
import 'package:tes1/login_page.dart';
import 'package:tes1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      initialRoute: Routes.list_makanan,
      getPages: Routes.myPages,
    );
  }
}