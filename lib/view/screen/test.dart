import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:notesapp/core/constant/imageasset.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child:
            Lottie.asset("assets/lottie/server.json", width: 250, height: 250),
      ),
    );
  }
}
