import 'package:endolap_paciente_app/src/services/alert_service.dart';
import 'package:endolap_paciente_app/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  
	var currentStep = 1.obs;
  var isLoading = false.obs;

  GlobalKey<FormState> loginFormState = GlobalKey<FormState>();
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
  var hasChronicDisease = 1.obs;
  var haveMedication = 1.obs;
  var medicationController = TextEditingController();
  var hasSurgery = 1.obs;
  var hasAllergy = 1.obs;
  var selectedBloodType = ''.obs;

  @override
  void onReady() {
    emailController.text = '';
    passwordController.text = '';

    super.onReady();
  }

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

  validateLogin(){
    if(loginFormState.currentState!.validate()){
      login();
    }
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

  void login() async {
    isLoading.value = true;

    final response = await _apiService.post('/auth/login', {
      'email': emailController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200) {
      //Guardar token
      GetStorage().write('token', response.data['token']);
      GetStorage().write('role', response.data['role']);
      GetStorage().write('user', response.data['user']);

      GetStorage().write('medical_forecast', response.data['user']['clinical_record']['medical_forecast']);
      GetStorage().write('blood_group', response.data['user']['clinical_record']['blood_group']);
      GetStorage().write('chronic_disease', response.data['user']['clinical_record']['chronic_disease']);
      GetStorage().write('take_medication', response.data['user']['clinical_record']['take_medication']);
      GetStorage().write('surgical_history', response.data['user']['clinical_record']['surgical_history']);
      GetStorage().write('have_allergies', response.data['user']['clinical_record']['have_allergies']);

      isLoading.value = false;

      Get.offNamed('/tabs');
    } else {
      AlertService().showErrorAlert(message: "Credenciales incorrectas");

      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // pageController.dispose();
    // //Account Tab
    // emailController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();

    // //Personal Data Tab
    // nameController.dispose();
    // lastNameController.dispose();
    // ciController.dispose();
    // birthDateController.dispose();
    // phoneNumberController.dispose();

    // //Medic Tab
    // medicalInsuranceController.dispose();

    super.onClose();
  }
}