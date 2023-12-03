import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {
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
		tabController.addListener(() {
			pageController.animateToPage(
				tabController.index,
				duration: const Duration(milliseconds: 300),
				curve: Curves.easeInOut,
			);
		});

    var user = GetStorage().read('user');

    //Account Tab
    emailController.text =  user['email'];

    // //Personal Data Tab
    nameController.text = GetStorage().read('name') ?? '';
    lastNameController.text = GetStorage().read('last_name') ?? '';
    ciController.text = GetStorage().read('uid') ?? '';
    birthDateController.text = GetStorage().read('date_of_birth') ?? '';
    phoneNumberController.text = GetStorage().read('phone') ?? '';

    // //Medic Tab
    medicalInsuranceController.text = GetStorage().read('medicalInsurance') ?? '';
    medicationController.text = GetStorage().read('medication') ?? '';
    selectedBloodType.value = GetStorage().read('bloodType') ?? '';

    super.onReady();
  }

  @override
  void onClose() {
    // tabController.dispose();
    // pageController.dispose();
    super.onClose();
  }
}