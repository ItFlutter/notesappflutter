import 'package:flutter/material.dart';

class CustomTitleAndSubtitleAuth extends StatelessWidget {
  final String title;
  final double sizeTitle;
  final Color colorTitle;
  final String subTitle;
  final double sizeSubTitle;
  final Color colorSubTitle;

  const CustomTitleAndSubtitleAuth(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.sizeTitle,
      required this.colorTitle,
      required this.sizeSubTitle,
      required this.colorSubTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 162),
          child: Text(
            title,
            style: TextStyle(
              color: colorTitle,
              fontWeight: FontWeight.w300,
              fontSize: sizeTitle,
            ),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: colorSubTitle,
            fontWeight: FontWeight.w400,
            fontSize: sizeSubTitle,
          ),
        ),
      ],
    );
  }
}
// AppColor.whiteColor.withOpacity(0.7)
// 40
//  AppColor.whiteColor.withOpacity(0.5)
//  21