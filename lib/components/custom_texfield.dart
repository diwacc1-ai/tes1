import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTexfield extends StatelessWidget {
  //variabel yang diperlukan
  final String myhint;
  final txtcontroller;
  final bool obscureText;

  const CustomTexfield({
    super.key, 
    required this.myhint, 
    this.txtcontroller,
    this.obscureText = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtcontroller,
      obscureText: obscureText,
      decoration: InputDecoration(hint: Text(myhint), 
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      )),
    );
  }
}