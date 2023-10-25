import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/view/widget/notes/custommodalbottomsheet.dart';
import 'package:notesapp/view/widget/notes/customtextformfieldnote.dart';

import '../../../controller/notes/edit-controller.dart';
import '../../../core/constant/color.dart';

import '../../../core/constant/constants.dart';
import '../../widget/homepage/custombuttonappbar.dart';
import '../../widget/notes/customappbaraddnote.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditNoteController controller = Get.put(EditNoteController());
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        controller.onWillPop();

        return Future.value(false);
      },
      child: GetBuilder<EditNoteController>(
        builder: (controller) {
          return Container(
              color: controller.selectColor != 0
                  ? colors[controller.selectColor]
                  : null,
              child: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 20),
                    child: Row(children: [
                      CustomButtonAppBar(
                        icon: Icons.arrow_back_ios_new_outlined,
                        onPressed: () {
                          controller.onWillPop();
                          // controller.onWillPop();
                        },
                      ),
                      const Spacer(),
                      CustomButtonAppBar(
                        icon: Icons.edit,
                        onPressed: () {
                          controller.convertToEdit();
                        },
                        active: controller.edit,
                      ),
                    ]),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        CuustomTextFormFieldNote(
                          readOnly: !controller.edit,
                          textSize: 35,
                          hintSize: 40,
                          hint: "Title",
                          controller: controller.title,
                          isEnglish: controller.isEnglish,
                        ),
                        CuustomTextFormFieldNote(
                          readOnly: !controller.edit,
                          textSize: 23,
                          hintSize: 23,
                          hint: "Note",
                          controller: controller.note,
                          isEnglish: controller.isEnglish,
                        ),
                      ],
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
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const CustomModalBottomSheet();
                            });
                      },
                    ),
                  ),
                ],
              )));
        },
      ),
    ));
  }
}
