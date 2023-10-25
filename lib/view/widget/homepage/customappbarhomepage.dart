import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/notes/view-controller.dart';
import '../../../core/constant/color.dart';
import 'custombuttonappbar.dart';

class CustomAppBarHomePage extends GetView<ViewController> {
  final void Function()? onPressedSearch;
  final void Function()? onPressedInfo;
  const CustomAppBarHomePage(
      {Key? key, this.onPressedSearch, this.onPressedInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.showSearch
        ? Row(
            children: [
              Expanded(
                  child: TextFormField(
                maxLines: 1,
                onChanged: ((value) {
                  if (value.isEmpty) controller.checkSearchForm();
                }),
                style: const TextStyle(color: AppColor.whiteColor),
                controller: controller.search,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.grey,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: AppColor.lightGrey),
                    onPressed: () {
                      controller.showSearchForm();
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColor.lightGrey,
                    ),
                    onPressed: () {
                      if (controller.search.text.isNotEmpty)
                        controller.searchData();
                    },
                  ),
                  hintText: "Search your notes",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColor.lightGrey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
                cursorColor: AppColor.lightGrey,
              )),
              const SizedBox(
                width: 10,
              ),
              CustomButtonAppBar(
                icon: Icons.info_outline,
                onPressed: onPressedInfo,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Notes",
                style: TextStyle(fontSize: 40, color: AppColor.whiteColor),
              ),
              const Spacer(),
              CustomButtonAppBar(
                icon: Icons.search,
                onPressed: onPressedSearch,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomButtonAppBar(
                icon: Icons.info_outline,
                onPressed: onPressedInfo,
              ),
            ],
          );
  }
}
