import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notesapp/controller/notes/add-controller.dart';
import 'package:notesapp/controller/notes/edit-controller.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/constants.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller;
    if (Get.currentRoute == "/editnote") {
      controller = Get.put(EditNoteController());
    } else {
      controller = Get.put(AddNoteController());
    }
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          color: controller.selectColor != 0
              ? colors[controller.selectColor]
              : null,
          height: Get.height / 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Color",
                    style: TextStyle(fontSize: 15, color: AppColor.whiteColor),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          colors.length,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    controller.changeColor(index);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: index == controller.selectColor
                                              ? Colors.blue
                                              : AppColor.lightGrey,
                                          width: index == controller.selectColor
                                              ? 2
                                              : 1)),
                                  child: index == controller.selectColor
                                      ? const Icon(
                                          Icons.done,
                                          color: Colors.blue,
                                        )
                                      : null,
                                ),
                              ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
