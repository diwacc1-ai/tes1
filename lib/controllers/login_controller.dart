import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tes1/models/loginModel.dart';
import 'package:tes1/routes.dart';

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http.post(url, body: {
        "username": txtUsername.text.toString(),
        "password": txtPassword.text.toString(),
      });

      isLoading.value = false;
      if (response.statusCode == 200) {

       loginModel.value = loginModelFromJson(response.body);

        if (loginModel.value?.status == true) {
          Get.snackbar("berhasil", loginModel.value!.message);
          Get.offNamed(Routes.mainMenu);
        } else {
          Get.snackbar("gagal", loginModel.value!.message);
        }
      } else {
        Get.snackbar("gagal", "cek internet connection");
      }
    } catch (e) {
      Get.snackbar("gagal", e.toString());
    }
  }
}