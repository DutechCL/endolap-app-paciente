import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;

    pageController.animateToPage(index, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    update();
  }
}