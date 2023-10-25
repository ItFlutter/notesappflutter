import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomLogoSignUp extends StatelessWidget {
  final String text;
  const CustomLogoSignUp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.backgroundColor.withOpacity(0.4),
          fontWeight: FontWeight.w900,
          fontSize: 80,
        ),
      ),
    );
  }
}
