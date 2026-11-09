import 'package:get/get.dart';
import 'package:tes1/pages/login_page.dart';
import 'package:tes1/pages/registration_page.dart';
import 'package:tes1/pages/confirm_registration_page.dart';
import 'package:tes1/pages/list_makanan_pages.dart';
import 'package:tes1/pages/detail_list_page.dart';
import 'package:tes1/pages/main_menu.dart';

class Routes {
  static const String login = '/login';
  static const String registration = '/registration';
  static const String confirmRegistration = '/confirm_registration';
  static const String listMakanan = "/list_makanan";
  static const String mainMenu = "/main_menu";
  static const String detailList = "/detail_list";

  static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: listMakanan, page: () => const ListMakananPages()),
    GetPage(name: detailList, page: () => const DetailListPage()),
    GetPage(name: mainMenu, page: () => MainMenu()),
  ];


}