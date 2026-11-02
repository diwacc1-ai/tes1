import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/components/custom_texfield.dart';
import 'package:tes1/login_controller.dart';



class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Column(
        children: [
          Text(
            "Welcome to application",
            style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 1, 1, 1),
              fontWeight: FontWeight.bold,
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              myHint: "input username",
              txtController: controller.txtUsername,
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(
              myHint: "input password",
              txtController: controller.txtPassword,
            ),
          ),

          Obx(() {
            return controller.isLoading.value
                ? const CircularProgressIndicator()
                : CustomButton(
              text: "Login",
              foregroundColor: const Color.fromARGB(255, 30, 175, 44),
              textStyle: const TextStyle(fontSize: 20),
              onPressed: () {
                controller.login();
              },
            );
          }),
        ],
      ),
    );
  }
}