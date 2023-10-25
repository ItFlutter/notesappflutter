import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/class/statuscode.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/functions/handlingdatacontroller.dart';
import 'package:notesapp/core/services/services.dart';
import 'package:notesapp/data/datasource/remote/auth/login.dart';

import 'sharedstatuscode-controller.dart';

class LoginController extends SharedStatusCode {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData = LoginData();
  MyServices myServices = Get.find();
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData
          .postData({'email': email.text, 'password': password.text});
      print(
          "================================responsecontroller===============================");
      print(response);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.homepage);
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
        } else {
          // statusRequest = StatusRequest.failure;
          return Get.defaultDialog(
              title: "Warning", content: const Text("Wrong Email OR Password"));
        }
      }
      update();
    }
  }

  goToPageSignUp() {
    Get.toNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
