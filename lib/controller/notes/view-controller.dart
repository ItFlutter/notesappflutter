import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/class/statuscode.dart';
import 'package:notesapp/core/constant/color.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/functions/handlingdatacontroller.dart';
import 'package:notesapp/core/services/services.dart';
import 'package:notesapp/data/datasource/remote/notes.dart';
import 'package:notesapp/data/model/notesmodel.dart';

import '../../core/constant/constants.dart';
import '../../view/widget/notes/custombuttondialog.dart';

class ViewController extends GetxController {
  bool showSearch = false;
  bool searchNote = false;
  late TextEditingController search;

  StatusRequest? statusRequest;
  NotesData notesData = NotesData();
  MyServices myServices = Get.find();
  List<NotesModel> data = [];
  List<NotesModel> dataSearch = [];
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notesData
        .getData({"userid": myServices.sharedPreferences.getString("id")});
    print(
        "================================responsecontroller===============================");
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];

        // listdata.forEach((e) => data.add(NotesModel.fromJson(e)));
        data.addAll(listdata.map((e) => NotesModel.fromJson(e)));

        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearchForm() {
    searchNote = false;
    statusRequest = StatusRequest.none;
    update();
  }

  searchData() async {
    searchNote = true;
    dataSearch.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notesData.searchData({"search": search.text});
    print(
        "================================responsecontroller===============================");
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];

        // listdata.forEach((e) => data.add(NotesModel.fromJson(e)));
        dataSearch.addAll(listdata.map((e) => NotesModel.fromJson(e)));

        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  showSearchForm() {
    showSearch = !showSearch;
    update();
  }

  sureDelete(String noteId) {
    Get.defaultDialog(
      backgroundColor: AppColor.backgroundColor,
      title: "Are you sure?",
      titleStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: AppColor.whiteColor),
      titlePadding: const EdgeInsets.only(top: 20),
      middleText:
          "Do you really want to delete this file.\nThis file cannot be restore.",
      middleTextStyle: const TextStyle(
        color: Color(0xffCFCFCF),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButtonDialog(
              color: AppColor.acceptColor,
              onPressed: () {
                Get.back();
              },
              text: "No",
            ),
            CustomButtonDialog(
              color: AppColor.deleteColor,
              onPressed: () async {
                await deleteData(noteId);
                Get.back();
              },
              text: "Yes",
            ),
          ],
        )
      ],
    );
  }

  deleteData(String noteId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notesData.deleteData({"noteid": noteId});
    print(
        "================================responsecontroller===============================");
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.notesId == noteId);
        dataSearch.removeWhere((element) => element.notesId == noteId);
      } else {
        Get.defaultDialog(
            title: "Warning", content: const Text("Something went wrong"));
      }
    }
    update();
  }

  getColor(int colorIndex) {
    return colors[colorIndex];
  }

  refreshIndecator() {
    getData();
  }

  showInfo() {
    Get.defaultDialog(
      backgroundColor: AppColor.backgroundColor,
      title: "Develop by -",
      titleStyle: const TextStyle(fontSize: 15, color: Color(0xffCFCFCF)),
      content: const Text(
        "Ahmad",
        style: TextStyle(
            fontSize: 17,
            color: Color(0xffCFCFCF),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  goToPageAddNote() {
    Get.toNamed(AppRoute.addnote);
  }

  goToPageEditNote(NotesModel model) {
    Get.toNamed(AppRoute.editnote, arguments: {"model": model});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
