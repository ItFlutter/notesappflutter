import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/constant/routes.dart';

import '../../core/class/statuscode.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/validinputlanguage.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/notes.dart';
import '../../view/widget/notes/custombuttondialog.dart';

class AddNoteController extends GetxController {
  bool isEnglish = true;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  NotesData notesData = NotesData();

  MyServices myServices = Get.find();

  bool readOnly = false;
  // bool collorPalette = false;
  int selectColor = 0;

  late TextEditingController title;
  late TextEditingController note;

  convertToReadOnly() {
    readOnly = !readOnly;
    update();
  }

  checkInput(value) {
    if (value.length == 1) {
      isEnglish = validEnglish(value);
      print(isEnglish);
    }
    update();
  }

  changeColor(int index) {
    selectColor = index;
    update();
  }

  backToPreviousPage() {
    Get.back();
  }

  onWillPop() {
    if (title.text.isNotEmpty || note.text.isNotEmpty) {
      return Get.defaultDialog(
        backgroundColor: AppColor.backgroundColor,
        title: "Warning",
        titleStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor),
        titlePadding: const EdgeInsets.only(top: 20),
        middleText: "Are your sure you want discard your changes ?",
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
                  Get.back();
                },
                text: "Keep",
              ),
            ],
          )
        ],
      );
    }
    Get.back();
    Get.rawSnackbar(
      messageText: const Text(
        "Empty note discarded",
        style: TextStyle(
            color: AppColor.backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      backgroundColor: AppColor.whiteColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 0),
      borderRadius: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: Get.height / 8),
    );
  }

  addData() async {
    if (title.text.isEmpty && note.text.isEmpty) {
      Get.offAllNamed(AppRoute.homepage);
      Get.rawSnackbar(
        messageText: const Text(
          "Empty note discarded",
          style: TextStyle(
              color: AppColor.backgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColor.whiteColor,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 0),
        borderRadius: 5,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: Get.height / 8),
      );
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await notesData.addData({
        "title": title.text,
        "note": note.text,
        "color": selectColor.toString(),
        "userid": myServices.sharedPreferences.getString("id")
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
      }
      update();
    }
  }

  @override
  void onInit() {
    title = TextEditingController();
    note = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
