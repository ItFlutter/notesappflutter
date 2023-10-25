import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/auth/login-controller.dart';
import 'package:notesapp/core/class/handlingdataview.dart';
import 'package:notesapp/core/constant/color.dart';
import 'package:notesapp/core/constant/imageasset.dart';
import 'package:notesapp/view/widget/auth/custombuttonauth.dart';
import 'package:notesapp/view/widget/auth/customhinttextauth.dart';
import 'package:notesapp/view/widget/auth/customtextauth.dart';
import 'package:notesapp/view/widget/auth/customtextbuttonauth.dart';
import '../../widget/auth/customtextformfieldauth.dart';
import '../../widget/auth/customtitleandsubtitleauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImageAsset.authBackground,
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<LoginController>(
            builder: ((controller) => RefreshIndicator(
                  onRefresh: () async {
                    await controller.refreshIndecator();
                  },
                  child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: Get.height / 12, bottom: 10),
                              child: const CustomTitleAndSubtitleAuth(
                                title: "Notes",
                                colorTitle: AppColor.whiteColor,
                                sizeTitle: 20,
                                subTitle:
                                    "The journey of a thousand\nmiles begins with a single step.",
                                colorSubTitle: AppColor.lightGrey,
                                sizeSubTitle: 15,
                              ),
                            ),
                            Container(
                              height: Get.height / 1.8,
                              decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  )),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextAuth(text: "Log in"),
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
                                      text: "Login",
                                      icon: Icons.arrow_forward,
                                      onTap: () {
                                        controller.login();
                                      },
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CustomHintTextAuth(
                                          text: "Don't have an account?",
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomTextButtonAuth(
                                          text: "Sign Up Now",
                                          fontSize: 11,
                                          onTap: () {
                                            controller.goToPageSignUp();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )),
          )),
    );
  }
}
