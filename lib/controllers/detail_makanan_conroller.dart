import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/models/makanan_model.dart';

class DetailMakananController extends GetxController {
  late MakananModel makanan;

  Widget buildStars(double rating, {double size = 20}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        IconData icon;
        if (rating >= i + 1) {
          icon = Icons.star;
        } else if (rating >= i + 0.5) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: Colors.amber, size: size);
      }),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Ambil data yang dikirim dari halaman list
    makanan = Get.arguments as MakananModel;
  }
}
