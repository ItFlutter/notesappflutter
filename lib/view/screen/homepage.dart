import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/notes/view-controller.dart';
import 'package:notesapp/core/class/handlingdataview.dart';
import 'package:notesapp/core/constant/color.dart';
import 'package:notesapp/view/widget/homepage/customappbarhomepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    ViewController controller = Get.put(ViewController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToPageAddNote();
          },
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: GetBuilder<ViewController>(
                    builder: ((controller) => CustomAppBarHomePage(
                          onPressedInfo: () {
                            controller.showInfo();
                          },
                          onPressedSearch: () {
                            controller.showSearchForm();
                          },
                        )),
                  )),
              Expanded(
                child: GetBuilder<ViewController>(builder: (controller) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.refreshIndecator();
                    },
                    child: HandlingDataView(
                        statusRequest: controller.statusRequest!,
                        widget: controller.searchNote
                            ? ListView.builder(
                                itemCount: controller.dataSearch.length,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.goToPageEditNote(
                                          controller.dataSearch[index]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: const BehindMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) {
                                                  controller.sureDelete(
                                                      controller
                                                          .dataSearch[index]
                                                          .notesId!);
                                                },
                                                backgroundColor:
                                                    AppColor.deleteColor,
                                                icon: Icons.delete,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            ]),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20),
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: controller.getColor(
                                                  int.parse(controller
                                                      .dataSearch[index]
                                                      .notesColor!)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.dataSearch[index]
                                                    .notesTitle!,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                controller.dataSearch[index]
                                                    .notesNote!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            : ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.goToPageEditNote(
                                          controller.data[index]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: const BehindMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) {
                                                  controller.sureDelete(
                                                      controller.data[index]
                                                          .notesId!);
                                                },
                                                backgroundColor:
                                                    AppColor.deleteColor,
                                                icon: Icons.delete,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )
                                            ]),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20),
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: controller.getColor(
                                                int.parse(controller
                                                    .data[index].notesColor!)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: controller.data[index]
                                                        .notesColor ==
                                                    "0"
                                                ? Border.all(
                                                    color: AppColor.lightGrey,
                                                    width: 0.5)
                                                : null,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .data[index].notesTitle!,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.whiteColor),
                                              ),
                                              Text(
                                                controller
                                                    .data[index].notesNote!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor.whiteColor
                                                        .withOpacity(0.9)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
