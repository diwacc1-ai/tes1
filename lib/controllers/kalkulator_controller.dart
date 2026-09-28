import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilHitung = 0.0.obs; // obs digunakan untuk update ke UI page
  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();
  final showWarning = false.obs;

  void updateWarning() {
    final angka1IsZero = double.tryParse(txtangka1.text) == 0;
    final angka2IsZero = double.tryParse(txtangka2.text) == 0;
    showWarning.value = angka1IsZero || angka2IsZero;
  }

  void calculate(void Function(double, double) operation) {
    if (txtangka1.text.isEmpty || txtangka2.text.isEmpty) return;

    final angka1 = double.parse(txtangka1.text);
    final angka2 = double.parse(txtangka2.text);
    if (angka1 == 0 || angka2 == 0) {
      showWarning.value = true;
      Get.snackbar(
        "Warning",
        "Input angka tidak boleh 0",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    showWarning.value = false;
    operation(angka1, angka2);
  }

  @override
  void onClose() {
    txtangka1.dispose();
    txtangka2.dispose();
    super.onClose();
  }

  // method tambah kurang kali dan bagi
  void tambah(double angka1, double angka2) {
    double hasiltambah = angka1 + angka2;
    hasilHitung.value = hasiltambah;
    Get.snackbar(
      "Hasil",
      "Hasil penjumlahan: $hasiltambah",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void kurang(double angka1, double angka2) {
    double hasilkurang = angka1 - angka2;
    hasilHitung.value = hasilkurang;
    Get.snackbar(
      "Hasil",
      "Hasil pengurangan: $hasilkurang",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void kali(double angka1, double angka2) {
    double hasilkali = angka1 * angka2;
    hasilHitung.value = hasilkali;
    Get.snackbar(
      "Hasil",
      "Hasil perkalian: $hasilkali",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void bagi(double angka1, double angka2) {
    double hasilbagi = angka1 / angka2;
    hasilHitung.value = hasilbagi;
    Get.snackbar(
      "Hasil",
      "Hasil pembagian: $hasilbagi",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
