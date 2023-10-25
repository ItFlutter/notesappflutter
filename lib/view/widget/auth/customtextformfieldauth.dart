import 'package:flutter/material.dart';
import 'package:notesapp/core/functions/validinput.dart';

import '../../../core/constant/color.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool? password;
  final TextEditingController controller;
  final int min;
  final int max;
  final String type;
  const CustomTextFormFieldAuth(
      {Key? key,
      required this.label,
      this.icon,
      this.password,
      required this.controller,
      required this.min,
      required this.max,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        return validInput(val!, min, max, type);
      },
      controller: controller,
      obscureText: password == true ? true : false,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: AppColor.grey),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.lightGrey),
            borderRadius: BorderRadius.circular(9)),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Icon(
          icon,
          color: AppColor.backgroundColor,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey),
            borderRadius: BorderRadius.circular(9)),
      ),
      cursorColor: AppColor.grey,
    );
  }
}
