import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/auth/signup-controller.dart';
import 'package:notesapp/core/class/handlingdataview.dart';
import 'package:notesapp/core/constant/color.dart';
import 'package:notesapp/core/constant/imageasset.dart';
import 'package:notesapp/view/widget/auth/custombottomsheetsignup.dart';
import 'package:notesapp/view/widget/auth/customlogosignup.dart';
import 'package:notesapp/view/widget/auth/customtitleandsubtitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImageAsset.authBackground,
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          bottomNavigationBar: InkWell(
            onTap: () async {
              await showModalBottomSheet<Widget>(
                  isScrollControlled: true,
                  constraints: BoxConstraints(maxHeight: Get.height / 1.5),
                  context: context,
                  builder: (context) {
                    return const CustomBottomSheetSignUp();
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
              alignment: Alignment.center,
              height: 55,
              decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: Colors.white54.withOpacity(0.4),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: GetBuilder<SignupController>(
            builder: ((controller) {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.refreshIndecator();
                },
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 20),
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: Get.width / 1.6),
                              child: const CustomLogoSignUp(text: "Notes")),
                          CustomTitleAndSubtitleAuth(
                            title: "Welcome",
                            colorTitle: AppColor.whiteColor.withOpacity(0.7),
                            sizeTitle: 40,
                            subTitle: "Get started by\ncreating your account",
                            colorSubTitle: AppColor.whiteColor.withOpacity(0.5),
                            sizeSubTitle: 21,
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            }),
          )),
    );
  }
}
