import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:endolap_paciente_app/src/controllers/SettingsController.dart';
import 'package:endolap_paciente_app/src/services/alert_service.dart';
import 'package:endolap_paciente_app/src/services/api_service.dart';

class RecuperateController extends GetxController {
  final ApiService _apiService = ApiService();
  final SettingsController _settingsController = Get.put(SettingsController());
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  GetStorage storage = GetStorage();
  Map<String, dynamic> arguments = Get.arguments ?? {};

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;
  var obscurePasswordControllerText = true.obs;
  var obscureResetPasswordControllerText = true.obs;


  void toggleObscureText(RxBool obscureText) {
    obscureText.value = !obscureText.value;
  }

  void onReady() {
    emailController.text = arguments['email'] ?? '';
    super.onReady();
  }

  @override
  void recuperate() async {
    isLoading.value = true;

    if (emailController.text.isEmpty) {
      AlertService().showErrorAlert(message: "Debe ingresar todos los campos");
      isLoading.value = false;
      return;
    }

    final response = await _apiService.post('/password/email', {
      'email': emailController.text,
    });

    if (response.statusCode == 200) {
      AlertService().showSuccessAlert(
          message: "Correo de recoperacion enviado correctamente");
      Get.offAllNamed('/auth/login');
    } else {
      isLoading.value = false;
      AlertService().showErrorAlert(
          message: "Sucedio un error enviando el correo de verificacion");
    }

    isLoading.value = false;
  }

  void changePassword() async {
    isLoading.value = true;

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        repeatPasswordController.text.isEmpty ||
        tokenController.text.isEmpty) {
      AlertService().showErrorAlert(message: "Debe ingresar todos los campos");
      isLoading.value = false;
      return;
    }

    if (passwordController.text != repeatPasswordController.text) {
      AlertService().showErrorAlert(
          message: "Contraseña y Repetir contraseña deben ser iguales");
      isLoading.value = false;
      return;
    }

    final response = await _apiService.post('/change-password', {
      'email': emailController.text,
      'verification_code': tokenController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200) {
      AlertService()
          .showSuccessAlert(message: "Contraseña actualizada correctamente");
      Get.offAllNamed('/auth/login');
    } else {
      isLoading.value = false;
      AlertService().showErrorAlert(message: "Datos incorrectos");
    }

    isLoading.value = false;
  }
}
