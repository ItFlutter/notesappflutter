import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonDialog extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  const CustomButtonDialog(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width / 4,
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: AppColor.whiteColor),
      ),
    );
  }
}
