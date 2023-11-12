import 'package:endolap_paciente_app/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  GlobalKey<FormState> loginFormState = GlobalKey<FormState>();
  var isLoading = false.obs;
  
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
  var hasChronicDisease = 1.obs;
  var haveMedication = 1.obs;
  var medicationController = TextEditingController();
  var hasSurgery = 1.obs;
  var hasAllergy = 1.obs;
  var selectedBloodType = ''.obs;

  @override
  void onReady() {
    emailController.text = 'super@dutech.cl';
    passwordController.text = 'super1';

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

  validateLogin(){
    if(loginFormState.currentState!.validate()){
      login();
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

      isLoading.value = false;

      Get.offNamed('/tabs');
    } else {
      Get.snackbar(
        'Error',
        'Credenciales incorrectas',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

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