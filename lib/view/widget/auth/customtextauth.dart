import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  final String text;
  const CustomTextAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    );
  }
}
