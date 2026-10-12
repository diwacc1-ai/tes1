import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/controllers/confirm_registration_pageController.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  ConfirmRegistrationPage({super.key});

  final conteoller = Get.put(ConfirmRegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Registration")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              "Periksa data kamu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                children: [
                  _InfoRow(
                    icon: Icons.person_outline,
                    label: "Username",
                    value: conteoller.username.toString(),
                  ),
                  _InfoRow(
                    icon: Icons.badge_outlined,
                    label: "Nama Lengkap",
                    value: conteoller.namalengkap.toString(),
                  ),
                  _InfoRow(
                    icon: Icons.email_outlined,
                    label: "Email",
                    value: conteoller.email.toString(),
                  ),
                  _InfoRow(
                    icon: Icons.favorite_border,
                    label: "Agama",
                    value: conteoller.agama.toString(),
                  ),
                  _InfoRow(
                    icon: Icons.wc_outlined,
                    label: "Jenis Kelamin",
                    value: conteoller.jenis_kelamin.toString(),
                  ),
                  _InfoRow(
                    icon: Icons.phone_outlined,
                    label: "Nomor",
                    value: conteoller.nomor.toString(),
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButton(text: "Oke", onPressed: () => Get.back()),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
