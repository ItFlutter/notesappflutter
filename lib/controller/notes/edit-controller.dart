import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/functions/validinputlanguage.dart';
import 'package:notesapp/data/model/notesmodel.dart';

import '../../core/class/statuscode.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/notes.dart';
import '../../view/widget/notes/custombuttondialog.dart';

class EditNoteController extends GetxController {
  late bool isEnglish;

  late NotesModel notesModel;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  NotesData notesData = NotesData();

  MyServices myServices = Get.find();

  bool edit = false;
  // bool collorPalette = false;
  late int selectColor;

  late TextEditingController title;
  late TextEditingController note;

  convertToEdit() {
    edit = !edit;
    update();
  }

  changeColor(int index) {
    selectColor = index;
    update();
  }

  onWillPop() {
    if (title.text != notesModel.notesTitle ||
        note.text != notesModel.notesNote) {
      return Get.defaultDialog(
        backgroundColor: AppColor.backgroundColor,
        title: "Warning",
        titleStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor),
        titlePadding: const EdgeInsets.only(top: 20),
        middleText: "Save changes ?",
        middleTextStyle: const TextStyle(
          color: Color(0xffCFCFCF),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonDialog(
                color: AppColor.deleteColor,
                onPressed: () {
                  Get.offAllNamed(AppRoute.homepage);
                },
                text: "Discard",
              ),
              CustomButtonDialog(
                color: AppColor.acceptColor,
                onPressed: () {
                  editData();
                },
                text: "Save",
              ),
            ],
          )
        ],
      );
    }
    Get.back();
  }

  editData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notesData.editData({
      "title": title.text,
      "note": note.text,
      "color": selectColor.toString(),
      "noteid": notesModel.notesId
    });
    print(
        "================================responsecontroller===============================");
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
      } else {
        Get.defaultDialog(
            title: "Warning", content: const Text("Something went wrong"));
      }

      update();
    }
  }

  @override
  void onInit() {
    notesModel = Get.arguments['model'];
    title = TextEditingController();
    note = TextEditingController();
    title.text = notesModel.notesTitle!;
    note.text = notesModel.notesNote!;
    selectColor = int.parse(notesModel.notesColor!);
    isEnglish = validEnglish(notesModel.notesTitle!.isNotEmpty
                ? notesModel.notesTitle!
                : notesModel.notesNote!) ==
            true
        ? true
        : false;
    // TODO: implement onInit
    super.onInit();
  }
}
