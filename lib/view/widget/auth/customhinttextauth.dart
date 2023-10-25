import 'package:flutter/material.dart';

import 'package:notesapp/core/constant/color.dart';

class CustomHintTextAuth extends StatelessWidget {
  final String text;
  const CustomHintTextAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: AppColor.grey, fontSize: 11),
    );
  }
}
