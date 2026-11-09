import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/routes.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    bool numericOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: numericOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        inputFormatters: numericOnly
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
            : null,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final txtUsername = TextEditingController();
    final txtNamaLengkap = TextEditingController();
    final txtEmail = TextEditingController();
    final agama = TextEditingController();
    final jenisKelamin = TextEditingController();
    final nomorWa = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(hint: "Username", controller: txtUsername),
            _buildTextField(
              hint: "Nama Lengkap",
              controller: txtNamaLengkap,
            ),
            _buildTextField(hint: "Email", controller: txtEmail),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(hintText: "Agama"),
                items: const [
                  "Islam",
                  "Kristen",
                  "Katolik",
                  "Hindu",
                  "Budha",
                  "Konghucu",
                ]
                    .map(
                      (value) => DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                onChanged: (value) => agama.text = value ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(hintText: "Jenis Kelamin"),
                items: const ["Laki-laki", "Perempuan"]
                    .map(
                      (value) => DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                onChanged: (value) => jenisKelamin.text = value ?? '',
              ),
            ),
            _buildTextField(
              hint: "Nomor",
              controller: nomorWa,
              numericOnly: true,
            ),
            CustomButton(
              text: "Send",
              onPressed: () {
                Get.toNamed(
                  Routes.confirmRegistration,
                  arguments: {
                    'username': txtUsername.text,
                    'namalengkap': txtNamaLengkap.text,
                    'email': txtEmail.text,
                    'agama': agama.text,
                    'jenis_kelamin': jenisKelamin.text,
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
