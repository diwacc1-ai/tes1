import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/controllers/kalkulator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = Get.put(KalkulatorController());

  Widget _buildInputField({
    required String hint,
    required TextEditingController textController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: textController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        onChanged: (_) => controller.updateWarning(),
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("my kalkulator")),
      body: Column(
        children: [
          _buildInputField(
            hint: "input angka 1",
            textController: controller.txtangka1,
          ),
          _buildInputField(
            hint: "input angka 2",
            textController: controller.txtangka2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "+",
                    onPressed: () => controller.calculate(controller.tambah),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: "-",
                    onPressed: () => controller.calculate(controller.kurang),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "/",
                    onPressed: () => controller.calculate(controller.bagi),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: "x",
                    onPressed: () => controller.calculate(controller.kali),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              "hasil ${controller.hasilHitung.value}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Obx(
            () => controller.showWarning.value
                ? const Text("warning", style: TextStyle(color: Colors.red))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
