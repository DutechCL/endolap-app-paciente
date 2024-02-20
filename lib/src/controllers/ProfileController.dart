import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:endolap_paciente_app/src/controllers/SettingsController.dart';
import 'package:endolap_paciente_app/src/services/alert_service.dart';
import 'package:endolap_paciente_app/src/services/api_service.dart';
import 'package:endolap_paciente_app/src/models/prevision_model.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();

  late TabController tabController = TabController(vsync: this, length: 3);
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

  Rx<List<PrevisionTypeModel>> previsionOptions =
      Rx<List<PrevisionTypeModel>>([]);

  var selectedPrevisionType = PrevisionTypeModel().obs;

  // Medic Tab
  TextEditingController medicalInsuranceController = TextEditingController();
  var hasChronicDisease = false.obs;
  var haveMedication = false.obs;
  var hasSurgery = false.obs;
  var hasAllergy = false.obs;
  var selectedBloodType = ''.obs;

  TextEditingController chronicDiseaseController = TextEditingController();
  TextEditingController medicationController = TextEditingController();
  TextEditingController surgeryController = TextEditingController();
  TextEditingController allergyController = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();

  RxBool isLoading = false.obs;
  var userId = 0;

  @override
  void onReady() {
    tabController.addListener(() {
      pageController.animateToPage(
        tabController.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
    getPrevisionTypes();
    setUser();
    hasChronicDisease.value = false;
    haveMedication.value = false;
    hasSurgery.value = false;
    hasAllergy.value = false;
    super.onReady();
  }

  void getPrevisionTypes() async {
    var response = await _apiService.getWithToken('/previsions/index');

    if (response.statusCode == 200) {
      previsionOptions.value = response.data['data']
          .map<PrevisionTypeModel>((e) => PrevisionTypeModel.fromJson(e))
          .toList();
      var prevision = GetStorage().read('medical_forecast');
      if (prevision != null) {
        selectedPrevisionType.value = previsionOptions.value.firstWhere(
          (previsionOptions) => previsionOptions.id == int.parse(prevision),
        );
      }
    } else {
      AlertService().showErrorAlert(
          message: 'Error al obtener los tipos de procedimientos');
    }
  }

  void setUser() {
    var user = GetStorage().read('user');

    //Account Tab
    emailController.text = user['email'];
    userId = user['id'] ?? 0;
    // //Personal Data Tab
    nameController.text = user['name'] ?? '';
    lastNameController.text = user['last_name'] ?? '';
    ciController.text = user['uid'] ?? '';
    birthDateController.text = user['date_of_birth'] ?? '';
    phoneNumberController.text = user['phone'] ?? '';
    // //Medic Tab
    bloodGroup.text = GetStorage().read('blood_group') ?? '';

    var chronicDisease = GetStorage().read('chronic_disease');
    var medication = GetStorage().read('take_medication');
    var surgery = GetStorage().read('surgical_history');
    var allergy = GetStorage().read('have_allergies');

    if (chronicDisease != null) {
      chronicDiseaseController.text = chronicDisease;
      hasChronicDisease.value = true;
    }

    if (medication != null) {
      medicationController.text = medication;
      haveMedication.value = true;
    }

    if (surgery != null) {
      surgeryController.text = surgery;
      hasSurgery.value = true;
    }

    if (allergy != null) {
      allergyController.text = allergy;
      hasAllergy.value = true;
    }
  }

  void updateUser() async {
    if (emailController.text.isEmpty) {
      AlertService().showErrorAlert(message: "Debe ingresar todos los campos");
      isLoading.value = false;
      return;
    }

    isLoading.value = true;

    final response =
        await _apiService.postWithToken('/patients/update/${userId}', {
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
      'name': nameController.text,
      'last_name': lastNameController.text,
      'uid': ciController.text,
      'date_of_birth': birthDateController.text,
      'phone': phoneNumberController.text,
      'medical_forecast': selectedPrevisionType.value.id,
      'chronic_disease': chronicDiseaseController.text,
      'take_medication': medicationController.text,
      'surgical_history': surgeryController.text,
      'have_allergies': allergyController.text,
      'blood_group': bloodGroup.text
    });

    if (response.statusCode == 200) {
      AlertService()
          .showSuccessAlert(message: "Usuario actualizado correctamente");
      // GetStorage().remove('token');
      // Get.offAllNamed('/auth/login');
    } else {
      isLoading.value = false;
      AlertService().showErrorAlert(message: "Credenciales incorrectas");
    }

    isLoading.value = false;
  }

  @override
  void onClose() {
    // tabController.dispose();
    // pageController.dispose();
    super.onClose();
  }
}
