import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notesapp/controller/auth/signup-controller.dart';
import 'package:notesapp/view/widget/auth/custombuttonauth.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import 'customtextauth.dart';
import 'customtextbuttonauth.dart';
import 'customtextformfieldauth.dart';

class CustomBottomSheetSignUp extends GetView<SignupController> {
  const CustomBottomSheetSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height / 2.0,
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: controller.formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextAuth(text: "Sign Up"),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFieldAuth(
                controller: controller.email,
                label: "Your Email",
                icon: Icons.mail,
                min: 6,
                max: 100,
                type: "email",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFieldAuth(
                controller: controller.password,
                label: "Your Password",
                icon: Icons.key,
                password: true,
                min: 4,
                max: 255,
                type: "password",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonAuth(
                text: "Sign Up",
                icon: Icons.arrow_forward,
                onTap: () {
                  controller.signUp();
                  // Get.back();
                },
              ),
              const Spacer(),
              Center(
                child: CustomTextButtonAuth(
                  text: "Log in",
                  fontSize: 16,
                  onTap: () {
                    controller.goToPageLogin();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
