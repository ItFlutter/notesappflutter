import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "The Field Can't Be Empty";
  }
  if (val.length < min) {
    return "The Length Can't Be Less Than $min";
  }
  if (val.length > max) {
    return "The Length Can't Be greate Than $max";
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "The Email Not Valid";
    }
  }
}
