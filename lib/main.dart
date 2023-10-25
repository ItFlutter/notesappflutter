import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/bindings/initialbindings.dart';
import 'package:notesapp/core/constant/apptheme.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/services/services.dart';
import 'package:notesapp/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: InitialBindings(),
      initialRoute: AppRoute.login,
      title: 'Notes App',
      theme: theme,
    );
  }
}
