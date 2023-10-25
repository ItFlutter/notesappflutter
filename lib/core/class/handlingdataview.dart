import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:notesapp/core/class/statuscode.dart';
import 'package:notesapp/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return ListView(
                children: [
                  Lottie.asset(
                    AppImageAsset.loading,
                    height: constraints.maxHeight,
                  ),
                ],
              );
            }),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? LayoutBuilder(
                builder: ((context, constraints) {
                  return ListView(
                    children: [
                      Lottie.asset(
                        AppImageAsset.offline,
                        height: constraints.maxHeight,
                      ),
                    ],
                  );
                }),
              )
            : statusRequest == StatusRequest.failure
                ? LayoutBuilder(
                    builder: ((context, constraints) {
                      return ListView(
                        children: [
                          Lottie.asset(
                            AppImageAsset.noData,
                            height: constraints.maxHeight,
                          ),
                        ],
                      );
                    }),
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? LayoutBuilder(
                        builder: ((context, constraints) {
                          return ListView(
                            children: [
                              Lottie.asset(
                                AppImageAsset.server,
                                height: constraints.maxHeight,
                              ),
                            ],
                          );
                        }),
                      )
                    : widget;
  }
}
