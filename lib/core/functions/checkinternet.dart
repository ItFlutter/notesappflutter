import 'dart:io';

checkInternet() async {
  try {
    List<InternetAddress> results =
        await InternetAddress.lookup("www.google.com");
    print(
        "===================================ResultCheckInternet======================================");
    print(results);
    if (results.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
