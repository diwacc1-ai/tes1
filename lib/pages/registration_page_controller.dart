import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/components/custom_texfield.dart';
import 'package:tes1/routes.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtUsername = TextEditingController();
    TextEditingController txtNamaLengkap = TextEditingController();
    TextEditingController txtEmail = TextEditingController();
    TextEditingController agama = TextEditingController();
    TextEditingController jenis_kelamin = TextEditingController();
    TextEditingController nomorWa = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTexfield(myhint: "Username", txtcontroller: txtUsername),
            CustomTexfield(
              myhint: "Nama Lengkap",
              txtcontroller: txtNamaLengkap,
            ),
            CustomTexfield(myhint: "Email", txtcontroller: txtEmail),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(hintText: "Agama"),
              items:
                  const [
                        "Islam",
                        "Kristen",
                        "Katolik",
                        "Hindu",
                        "Budha",
                        "Konghucu",
                      ]
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
              onChanged: (value) => agama.text = value ?? '',
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(hintText: "Jenis Kelamin"),
              items: const ["Laki-laki", "Perempuan"]
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              onChanged: (value) => jenis_kelamin.text = value ?? '',
            ),
            CustomTexfield(
              myhint: "Nomor",
              txtcontroller: nomorWa,
              numericOnly: true,
            ),
            CustomButton(
              text: "Send",
              onPressed: () {
                Get.toNamed(
                  Routes.confirm_registration,
                  arguments: {
                    'username': txtUsername.text,
                    'namalengkap': txtNamaLengkap.text,
                    'email': txtEmail.text,
                    'agama': agama.text,
                    'jenis_kelamin': jenis_kelamin.text,
                    'nomor': nomorWa.text,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
