import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CuustomTextFormFieldNote extends StatelessWidget {
  final bool readOnly;
  final TextEditingController? controller;
  final double textSize;
  final double hintSize;
  final String hint;
  final bool? isEnglish;
  final void Function(String)? onChanged;
  const CuustomTextFormFieldNote(
      {Key? key,
      required this.readOnly,
      this.controller,
      required this.textSize,
      required this.hintSize,
      required this.hint,
      this.isEnglish,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: isEnglish == true ? TextDirection.ltr : TextDirection.rtl,
      readOnly: readOnly,

      // validator: (val) {
      //   return validInput(val!, 0, 65000, "");
      // },
      onChanged: onChanged,
      style: TextStyle(
        fontSize: textSize,
        color: AppColor.whiteColor,
      ),
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: double.infinity),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: hintSize,
          color: const Color(0xff9A9A9A),
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      cursorColor: AppColor.whiteColor,
    );
  }
}
