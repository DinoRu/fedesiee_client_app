import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {

  PageController pageController = PageController();
  

  int page = 0;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  scroll(int index) {
    page = index;
    update();
  }
}