import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
	var currentStep = 1.obs;
  GlobalKey<FormState> accountFormState = GlobalKey<FormState>();
  GlobalKey<FormState> personalDataFormState = GlobalKey<FormState>();
  GlobalKey<FormState> medicFormState = GlobalKey<FormState>();

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

	nextPage(){
		currentStep.value++;

		pageController.nextPage(
			duration: const Duration(milliseconds: 300),
			curve: Curves.easeInOut,
		);
	}

	previousPage(){
		currentStep.value--;

		pageController.previousPage(
			duration: const Duration(milliseconds: 300),
			curve: Curves.easeInOut,
		);
	}

  validateAccountTab() {
    if (accountFormState.currentState!.validate()) {
      nextPage();
    }
  }

  validatePersonalDataTab() {
    if (personalDataFormState.currentState!.validate()) {
      nextPage();
    }
  }

  validateMedicTab() {
    if (medicFormState.currentState!.validate()) {
      Get.offAllNamed('/tabs');
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    //Account Tab
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    //Personal Data Tab
    nameController.dispose();
    lastNameController.dispose();
    ciController.dispose();
    birthDateController.dispose();
    phoneNumberController.dispose();

    //Medic Tab
    medicalInsuranceController.dispose();

    super.onClose();
  }
}