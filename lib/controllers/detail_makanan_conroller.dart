import 'package:get/get.dart';
import 'package:tes1/models/makanan_model.dart';

class DetailMakananController extends GetxController {
  late MakananModel makanan;

  @override
  void onInit() {
    super.onInit();
    // Ambil data yang dikirim dari halaman list
    makanan = Get.arguments as MakananModel;
  }
}