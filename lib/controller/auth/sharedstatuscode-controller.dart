import 'package:get/get.dart';

import '../../core/class/statuscode.dart';

class SharedStatusCode extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  refreshIndecator() {
    statusRequest = StatusRequest.none;
    update();
  }
}
