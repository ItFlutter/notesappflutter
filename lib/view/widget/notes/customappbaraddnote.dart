import 'package:flutter/material.dart';

import '../homepage/custombuttonappbar.dart';

class CustomAppBarAddNote extends StatelessWidget {
  final void Function()? onPressedBack;
  final void Function()? onPressedReadOnly;
  final void Function()? onPressedSave;
  final bool active;
  const CustomAppBarAddNote(
      {Key? key,
      this.onPressedBack,
      this.onPressedReadOnly,
      this.onPressedSave,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Row(children: [
        CustomButtonAppBar(
          icon: Icons.arrow_back_ios_new_outlined,
          onPressed: onPressedBack,
        ),
        const Spacer(),
        CustomButtonAppBar(
          icon: Icons.visibility_outlined,
          onPressed: onPressedReadOnly,
          active: active,
        ),
        const SizedBox(
          width: 20,
        ),
        CustomButtonAppBar(
          icon: Icons.save_outlined,
          onPressed: onPressedSave,
        ),
      ]),
    );
  }
}
