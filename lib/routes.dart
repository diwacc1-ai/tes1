import 'package:get/get.dart';
import 'package:tes1/pages/registration_page.dart';
import 'package:tes1/pages/confirm_registration_page.dart';
import 'package:tes1/pages/list_makanan_pages.dart';
import 'package:tes1/pages/detail_list_page.dart';

class Routes {
  static const String registration = '/registration';
  static const String confirm_registration = '/confirm_registration';
  static const String list_makanan = "/list_makanan";
  static const String detail_list = "/detail_list";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistrationPage()),
    GetPage(name: list_makanan, page: () => const ListMakananPages()),
    GetPage(name: detail_list, page: () => const DetailListPage()),
  ];
}