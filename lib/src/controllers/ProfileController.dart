import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
	late TabController tabController;
	final PageController pageController = PageController();

	@override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
		
		tabController.addListener(() {
			pageController.animateToPage(
				tabController.index,
				duration: const Duration(milliseconds: 300),
				curve: Curves.easeInOut,
			);
		});
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}