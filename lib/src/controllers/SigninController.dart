import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:endolap_paciente_app/src/controllers/SettingsController.dart';
import 'package:endolap_paciente_app/src/services/alert_service.dart';
import 'package:endolap_paciente_app/src/services/api_service.dart';

class SigninController extends GetxController {
  final ApiService _apiService = ApiService();
  final SettingsController _settingsController = Get.put(SettingsController());
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  GetStorage storage = GetStorage();

  final PageController pageController = PageController();
  GlobalKey<FormState> accountFormState = GlobalKey<FormState>();
  GlobalKey<FormState> personalDataFormState = GlobalKey<FormState>();
  GlobalKey<FormState> medicFormState = GlobalKey<FormState>();

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

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;
  var obscurePasswordControllerText = true.obs;
  var obscureRepeatPasswordControllerText = true.obs;

  void toggleObscureText(RxBool obscureText) {
    obscureText.value = !obscureText.value;
  }

  var currentStep = 1.obs;

  nextPage() {
    currentStep.value++;

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  previousPage() {
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
      singIn();
    }
  }

  validateMedicTab() {
    if (medicFormState.currentState!.validate()) {
      singIn();
    }
  }

  @override
  void singIn() async {
    isLoading.value = true;

    final response = await _apiService.post('/patients/register', {
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,

      'name' : nameController.text,
      'last_name': lastNameController.text,
      'uid': ciController.text,
      'date_of_birth': birthDateController.text,
      'phone': phoneNumberController.text,
      
      // 'medical_forecast': medicalInsuranceController.text,
      // 'chronic_disease': hasChronicDisease.value,
      // 'take_medication': haveMedication.value,
      // 'surgical_history': hasSurgery.value,
      // 'have_allergies': hasAllergy.value,
    });
 
    if (response.statusCode == 200) {
      AlertService().showSuccessAlert(message: "Usuario creado correctamente");

      Get.offAllNamed('/auth/login');
    } else {
      isLoading.value = false;
      AlertService().showErrorAlert(message: "Credenciales incorrectas");
    }

    isLoading.value = false;
  }
}
