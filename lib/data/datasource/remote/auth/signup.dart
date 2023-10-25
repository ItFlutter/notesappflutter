import 'package:get/get.dart';
import 'package:notesapp/linkapi.dart';

import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud = Get.find();
  postData(Map data) async {
    var response = await crud.postData(AppLink.signup, data);
    print(
        "================================responsedata===============================");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
