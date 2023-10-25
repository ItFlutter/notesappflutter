import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/notes/add-controller.dart';
import 'package:notesapp/view/widget/notes/custommodalbottomsheet.dart';
import 'package:notesapp/view/widget/notes/customtextformfieldnote.dart';

import '../../../core/constant/color.dart';

import '../../../core/constant/constants.dart';
import '../../widget/notes/customappbaraddnote.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddNoteController());
    return Scaffold(body: GetBuilder<AddNoteController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.onWillPop();
            return Future.value(true);
          },
          child: Container(
              color: controller.selectColor != 0
                  ? colors[controller.selectColor]
                  : null,
              child: SafeArea(
                  child: Column(
                children: [
                  CustomAppBarAddNote(
                    active: controller.readOnly,
                    onPressedBack: () {
                      controller.onWillPop();
                    },
                    onPressedReadOnly: () {
                      controller.convertToReadOnly();
                    },
                    onPressedSave: () {
                      controller.addData();
                    },
                  ),
                  Form(
                    key: controller.formState,
                    child: Expanded(
                      child: ListView(
                        children: [
                          CuustomTextFormFieldNote(
                            readOnly: controller.readOnly,
                            textSize: 35,
                            hintSize: 40,
                            hint: "Title",
                            controller: controller.title,
                            onChanged: (value) {
                              controller.checkInput(value);
                            },
                            isEnglish: controller.isEnglish,
                          ),
                          CuustomTextFormFieldNote(
                            readOnly: controller.readOnly,
                            textSize: 23,
                            hintSize: 23,
                            hint: "Note",
                            controller: controller.note,
                            onChanged: (value) {
                              controller.checkInput(value);
                            },
                            isEnglish: controller.isEnglish,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.palette_outlined,
                        color: AppColor.hintColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const CustomModalBottomSheet();
                            });
                      },
                    ),
                  ),
                ],
              ))),
        );
      },
    ));
  }
}
