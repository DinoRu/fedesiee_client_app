import 'dart:math';

import 'package:fedesie_client_app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/fedesie_logo.png', fit: BoxFit.cover),
          )
        ),
      ),
    );
  }
}
