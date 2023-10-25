import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/class/statuscode.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/functions/handlingdatacontroller.dart';
import 'package:notesapp/data/datasource/remote/auth/signup.dart';

import 'sharedstatuscode-controller.dart';

class SignupController extends SharedStatusCode {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  SignUpData signUpData = SignUpData();
  signUp() async {
    if (formState.currentState!.validate()) {
      Get.back();
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData({
        "email": email.text,
        "password": password.text,
      });
      print(
          "================================responsecontroller===============================");
      print(response);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'failure email') {
          return Get.defaultDialog(
              title: "Warning",
              content: const Text("The Email Already Exists"));
        } else if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.login);
        } else {
          return Get.defaultDialog(
              title: "Error", content: const Text("Something Went Wrong"));
        }
      }
      update();
    }
  }

  goToPageLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
