import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/components/custom_button.dart';
import 'package:tes1/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  static const Color _fieldColor = Color(0xFFF0F1F1);
  static const Color _secondaryTextColor = Color(0xFF606060);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 48),
                        const SizedBox(height: 48),
                        const Text(
                          'Hi there,\nwelcome back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1B1B1B),
                            fontSize: 30,
                            height: 1.15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 76),
                        TextField(
                          controller: controller.txtUsername,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: _inputDecoration('Username'),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: controller.txtPassword,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => controller.login(),
                          decoration: _inputDecoration('Password'),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 48),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                color: _secondaryTextColor,
                                fontSize: 16,
                                height: 1.35,
                              ),
                              children: [
                                TextSpan(
                                  text: 'By continuing, you agree to our ',
                                ),
                                TextSpan(
                                  text: 'User Agreement',
                                  style: TextStyle(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' and acknowledge that you understand '
                                      'the ',
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: 'Continue',
                                  width: double.infinity,
                                  height: 64,
                                  backgroundColor: _fieldColor,
                                  foregroundColor: const Color(0xFFAAAAAA),
                                  borderRadius: BorderRadius.circular(40),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  onPressed: controller.login,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: _secondaryTextColor, fontSize: 18),
      filled: true,
      fillColor: _fieldColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(36),
        borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
      ),
    );
  }
}
