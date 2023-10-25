import 'package:flutter/material.dart';

import 'package:notesapp/core/constant/color.dart';

class CustomTextButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double fontSize;

  const CustomTextButtonAuth(
      {Key? key, required this.text, this.onTap, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.grey,
            fontSize: fontSize,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
