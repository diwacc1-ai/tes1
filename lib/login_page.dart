import 'package:flutter/material.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/components/custom_texfield.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login page")),
      body: Column(
        children: [
          Text(
            "Welcome to application " + statusLogin,
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 3, 62, 189),
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTexfield(
              myhint: "input username",
              txtcontroller: txtUsername,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTexfield(
              myhint: "input password",
              txtcontroller: txtPassword,
            ),
          ),

          CustomButton(
            text: "Login",
            onPressed: () {
              setState(() {
                // fungsinya untuk reload / refresh satu page full
                String username = txtUsername.text.toString();
                String password = txtPassword.text.toString();
                if (username == "admin" && password == "admin") {
                  statusLogin = "admin";
                  print("sukses login");
                } else {
                  statusLogin = "failed";
                  print("gagal login");
                }
              });
            },
            textStyle: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 18, 197, 188),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}