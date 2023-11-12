import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
	late TabController tabController = TabController(vsync: this, length: 3);
	final PageController pageController = PageController();

  //Account Tab
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Personal Data Tab
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  //Medic Tab
  TextEditingController medicalInsuranceController = TextEditingController();
  var hasChronicDisease = 1.obs;
  var haveMedication = 1.obs;
  var medicationController = TextEditingController();
  var hasSurgery = 1.obs;
  var hasAllergy = 1.obs;
  var selectedBloodType = ''.obs;

	@override
  void onReady() {
    var user = GetStorage().read('user');
    print(user);
    
		tabController.addListener(() {
			pageController.animateToPage(
				tabController.index,
				duration: const Duration(milliseconds: 300),
				curve: Curves.easeInOut,
			);
		});

    super.onReady();
  }

  @override
  void onClose() {
    // tabController.dispose();
    // pageController.dispose();
    super.onClose();
  }
}