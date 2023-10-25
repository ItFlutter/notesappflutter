bool validEnglish(String value) {
  RegExp regex = RegExp("^[\u0000-\u007F]+\$");
  return (!regex.hasMatch(value)) ? false : true;
}

bool validArabic(String value) {
  RegExp regex = RegExp("^[\u0621-\u064A\u0660-\u0669 1-9]+\$");
  return (!regex.hasMatch(value)) ? false : true;
}
