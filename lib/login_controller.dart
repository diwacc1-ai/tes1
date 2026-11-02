import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

TextEditingController txtUsername = TextEditingController();
TextEditingController txtPassword = TextEditingController();

var isLoading = false.obs;

// method hit API
void login() async{

  if(txtUsername.text.toString().isEmpty || txtPassword.text. toString().isEmpty){
  Get. snackbar("error", "username dan password harus terisi");
}else{

  try {

  isLoading.value = true; // sebagai tanda di page nya muncul loading widget
  final url = Uri.parse("https://mediadwi.com/api/latihan/login");

  final response = await http.post(url, body: {
  "username" : txtUsername. text. toString(),
  "password" : txtPassword. text. toString()
  });
  
  isLoading.value = false;
  if(response.statusCode == 200){
  // kita ambil jsonnya message pindah tampilan ke main menu
  // contoh json yang paling sederhana, next pertemuan json yang kompleks
  final data = jsonDecode(response.body);
  if(data['status'] == true){
    Get.snackbar("berhasil", data['message']);
  }else{
    Get.snackbar("gagal", data['message']);
  }

  }else{
    Get.snackbar("gagal", "cek internet connection");
  }
    } catch (e) {
        Get.snackbar("gagal", e.toString());
    }

    }

  }
  
}