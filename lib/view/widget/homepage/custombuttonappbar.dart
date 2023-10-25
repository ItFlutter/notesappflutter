import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final bool? active;
  const CustomButtonAppBar(
      {Key? key, required this.icon, this.onPressed, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: active == true ? AppColor.whiteColor : AppColor.grey,
            borderRadius: BorderRadius.circular(15)),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: active == true ? AppColor.grey : AppColor.whiteColor,
              size: 22,
            )));
  }
}
