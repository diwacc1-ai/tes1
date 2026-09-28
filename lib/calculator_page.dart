import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_texfield.dart';
import 'package:tes1/controllers/kalkulator_controller.dart';
import 'package:tes1/components/custom_button.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = Get.put(KalkulatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("my kalkulator")),
      body: Column(
        children: [
          CustomTexfield(
            myhint: "input angka 1",
            txtcontroller: controller.txtangka1,
            numericOnly: true,
            onChanged: (_) => controller.updateWarning(),
          ),
          CustomTexfield(
            myhint: "input angka 2",
            txtcontroller: controller.txtangka2,
            numericOnly: true,
            onChanged: (_) => controller.updateWarning(),
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "+",
                  onPressed: () => controller.calculate(controller.tambah),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: "-",
                  onPressed: () => controller.calculate(controller.kurang),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "/",
                  onPressed: () => controller.calculate(controller.bagi),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: "x",
                  onPressed: () => controller.calculate(controller.kali),
                ),
              ),
            ],
          ),

          Obx(
            () => Text(
              "hasil ${controller.hasilHitung.value}",
              style: TextStyle(fontSize: 20),
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
