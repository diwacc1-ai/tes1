import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/menu/history_page.dart';
import 'package:tes1/menu/home_page.dart';
import 'package:tes1/menu/pofile_page.dart';

class MainMenuControllers extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> get listpages => const [HomePage(), HistoryPage(), ProfilPage()];
}
