import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("id") == "1") {
      return const RouteSettings(name: AppRoute.homepage);
    }
  }
}
