import 'package:get/get.dart';
import 'package:notesapp/linkapi.dart';

import '../../../core/class/crud.dart';

class NotesData {
  Crud crud = Get.find();
  getData(Map data) async {
    var response = await crud.postData(AppLink.view, data);
    print(
        "================================responsedata===============================");
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.delete, data);
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data) async {
    var response = await crud.postData(AppLink.add, data);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data) async {
    var response = await crud.postData(AppLink.edit, data);
    return response.fold((l) => l, (r) => r);
  }

  searchData(Map data) async {
    var response = await crud.postData(AppLink.search, data);
    return response.fold((l) => l, (r) => r);
  }
}
