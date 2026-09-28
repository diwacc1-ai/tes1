import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTexfield extends StatelessWidget {
  //variabel yang diperlukan
  final String myhint;
  final TextEditingController? txtcontroller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool numericOnly;

  const CustomTexfield({
    super.key, 
    required this.myhint, 
    this.txtcontroller,
    this.onChanged,
    this.obscureText = false,
    this.numericOnly = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtcontroller,
      onChanged: onChanged,
      obscureText: obscureText,
        keyboardType: numericOnly ? TextInputType.number : TextInputType.text,
        inputFormatters: numericOnly
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(hint: Text(myhint), 
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      )),
    );
  }
}