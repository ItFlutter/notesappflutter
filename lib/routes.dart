import 'package:get/get.dart';
import 'package:notesapp/core/constant/routes.dart';
import 'package:notesapp/core/middleware/mymiddleware.dart';
import 'package:notesapp/view/screen/auth/login.dart';
import 'package:notesapp/view/screen/homepage.dart';
import 'package:notesapp/view/screen/notes/add.dart';
import 'package:notesapp/view/screen/notes/edit.dart';
import 'package:notesapp/view/screen/test.dart';

import 'view/screen/auth/signup.dart';

List<GetPage<dynamic>>? routes = [
//==================================Test===========================================
  GetPage(name: AppRoute.test, page: () => const Test()),
//==================================HomePage===========================================
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
//==================================Auth===========================================
  GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
//==================================Note===========================================

  GetPage(name: AppRoute.addnote, page: () => const AddNote()),
  GetPage(name: AppRoute.editnote, page: () => const EditNote()),
];
