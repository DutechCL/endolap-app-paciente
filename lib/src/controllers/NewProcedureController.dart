import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/models/procedure_type_model.dart';
import 'package:endolap_paciente_app/src/models/prevision_model.dart';
import 'package:endolap_paciente_app/src/models/sugery_type_model.dart';
import 'package:endolap_paciente_app/src/services/alert_service.dart';
import 'package:endolap_paciente_app/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class NewProcedureController extends GetxController {
  final ApiService _apiService = ApiService();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final PageController pageController = PageController();
  var isLoading = false.obs;
  var isSheduleLoading = false.obs;
  var isReadOnly = false.obs;

  GlobalKey<FormState> step1FormState = GlobalKey<FormState>();
  GlobalKey<FormState> step2FormState = GlobalKey<FormState>();
  GlobalKey<FormState> step3FormState = GlobalKey<FormState>();

  TextEditingController procedureTypeController = TextEditingController();
  TextEditingController surgeryOptionsController = TextEditingController();
  TextEditingController procedureDateController = TextEditingController();
  TextEditingController procedureTimeController = TextEditingController();

  Rx<List<ProcedureTypeModel>> procedureTypes =
      Rx<List<ProcedureTypeModel>>([]);
  Rx<List<SugeryTypeModel>> surgeryOptions = Rx<List<SugeryTypeModel>>([]);
  Rx<List<PrevisionTypeModel>> previsionOptions =
      Rx<List<PrevisionTypeModel>>([]);

  var selectedProcedureType = ProcedureTypeModel().obs;
  var selectedSugeryTupe = SugeryTypeModel().obs;
  var selectedPrevisionType = PrevisionTypeModel().obs;

  Rx<List<String>> shedule = Rx<List<String>>([]);
  Rx<DateTime> selectedDate = DateTime.now().obs;

  var selectedHour = ''.obs;
  var procedureIdCreated = 0.obs;
  var userId = 0;
  var id = 0;

  //Step 3
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var listProfessionalsWidget = List<Widget>.empty().obs;
  var isLoadingTeam = false.obs;

  var selectedStep = 2.obs;
  var upperBound = 3.obs;
  var currentStep = 1.obs;

  @override
  void onReady() async {
    currentStep.value = 1;
    getProcedureTypes();
    getPrevisionTypes();

    var user = GetStorage().read('user') ?? '';
    nameController.text = user['name'] ?? '';
    lastNameController.text = user['last_name'] ?? '';
    ciController.text = user['uid'] ?? '';
    birthDateController.text = user['date_of_birth'] ?? '';
    phoneNumberController.text = user['phone'] ?? '';
    userId = user['id'] ?? '';

    currentStep.listen((value) {
      if (value == 1) {
      } else if (value == 2) {
        fetchShedule(formatter.format(selectedDate.value));
      }
    });

    selectedHour.listen((value) async {
      if (value != "") {
        if (procedureIdCreated.value == 0) {
          // await saveProcedureHeader();
        } else {
          // await updateProcedure();
        }
      }
    });

    super.onReady();
  }

  void getPrevisionTypes() async {
    var response = await _apiService.getWithToken('/previsions/index');

    if (response.statusCode == 200) {
      previsionOptions.value = response.data['data']
          .map<PrevisionTypeModel>((e) => PrevisionTypeModel.fromJson(e))
          .toList();
    } else {
      AlertService().showErrorAlert(
          message: 'Error al obtener los tipos de procedimientos');
    }
  }

  void getProcedureTypes() async {
    var response = await _apiService.getWithToken('/types/index');

    if (response.statusCode == 200) {
      procedureTypes.value = response.data['data']
          .map<ProcedureTypeModel>((e) => ProcedureTypeModel.fromJson(e))
          .toList();

      ever(selectedProcedureType, (_) {
        filterSurgeryOptions();
      });
    } else {
      AlertService().showErrorAlert(
          message: 'Error al obtener los tipos de procedimientos');
    }
  }

  void getSurgeryTypes() async {
    var response = await _apiService.getWithToken('/procedures/index');

    if (response.statusCode == 200) {
      surgeryOptions.value = response.data['data']
          .map<SugeryTypeModel>((e) => SugeryTypeModel.fromJson(e))
          .toList();
    } else {
      AlertService()
          .showErrorAlert(message: 'Error al obtener los tipos de cirugias');
    }
  }

  void save() async {
    isLoading.value = true;
    final DateFormat dateFormatter = DateFormat(
        'yyyy-MM-dd'); // Puedes ajustar el formato según tus necesidades

    String formattedDate = dateFormatter.format(selectedDate.value);

    final response =
        await _apiService.postWithToken('/scheduleProcedure/patient/store', {
      'user_id': userId,
      'type_id': selectedProcedureType.value.id,
      'procedure_id': selectedSugeryTupe.value.id,
      'date': formattedDate,
      'hour': selectedHour.value,
      'prevision_id': selectedPrevisionType.value.id,
    });

    if (response.statusCode == 200) {
      id = response.data['data']['id'];
      _successDialog();
    } else {
      isLoading.value = false;
      AlertService().showErrorAlert(
          message: "Sucedio un error enviando el correo de verificacion");
    }

    isLoading.value = false;
  }

  void filterSurgeryOptions() async {
    var typeId = selectedProcedureType.value.id;

    var response = await _apiService.getWithToken('/procedures/index');

    if (response.statusCode == 200) {
      surgeryOptions.value = response.data['data']
          .map<SugeryTypeModel>((e) => SugeryTypeModel.fromJson(e))
          .toList();
    } else {
      AlertService()
          .showErrorAlert(message: 'Error al obtener los tipos de cirugias');
    }

    if (typeId != null) {
      var filteredOptions = surgeryOptions.value
          .where((surgeryType) => surgeryType.typeId == typeId)
          .toList();

      surgeryOptions.value = filteredOptions;
    }
  }

  void fetchShedule(String date) async {
    if (isReadOnly.value == true) return;
    shedule.value = [];

    isSheduleLoading.value = true;
    var sugeryTypeId = selectedSugeryTupe.value.id;

    var response = await _apiService
        .getWithToken('/scheduleProcedure/availableTime/$date/$sugeryTypeId');

    if (response.statusCode == 200) {
      if (response.data['status'] != false) {
        var data = response.data['data'] as List<dynamic>;

        shedule.value = data.map<String>((e) => e.toString()).toList();
      } else {
        AlertService().showWarningAlert(message: response.data['message']);
      }
    } else {
      AlertService().showErrorAlert(message: 'Error al obtener los pacientes');
    }

    isSheduleLoading.value = false;
  }

  void downloadFile() async {
    String uri =
        '${url()}/procedures/${selectedSugeryTupe.value.id}/download/document/?patient_id=$userId';
    await launchUrl(Uri.parse(uri));
  }

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

  validateStep1() {
    if (step1FormState.currentState!.validate()) {
      nextPage();
    }
  }

  validateStep2() {
    if (step2FormState.currentState!.validate()) {
      nextPage();
    }
  }

  validateStep3() {
    if (step3FormState.currentState!.validate()) {
      nextPage();
    }
  }

  buildResumeDialog() {
    final DateFormat dateFormatter = DateFormat(
        'yyyy-MM-dd'); // Puedes ajustar el formato según tus necesidades

    String formattedDate = dateFormatter.format(selectedDate.value);
    Get.defaultDialog(
        title: 'Agendar procedimiento',
        titleStyle: titleStyle(),
        titlePadding: const EdgeInsets.symmetric(vertical: 20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Datos del paciente", style: cardTitleStyle()),
            const SizedBox(height: 10),
            Text('${nameController.text} ${lastNameController.text}'),
            const SizedBox(height: 5),
            // const Text('FONASA'),
            const SizedBox(height: 5),
            Text('CI: ${ciController.text}'),
            const SizedBox(height: 20),
            Text("Hora agendada", style: cardTitleStyle()),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
                SizedBox(width: 7),
                Text('Las Heras 650, Los Andes'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.date_range_outlined,
                    color: Color(0xff00d6d6), size: 17),
                const SizedBox(width: 7),
                Text(formattedDate),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.access_time_outlined,
                    color: Color(0xff00d6d6), size: 17),
                const SizedBox(width: 7),
                Text(selectedHour.value),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: accentButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text('Agendar'),
                onPressed: () {
                  Get.back();

                  save();
                }),
            const SizedBox(height: 10),
            TextButton(
                style: textButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text('Cancelar'),
                onPressed: () {
                  Get.back();
                }),
          ],
        ));
  }

  _successDialog() {
    return Get.defaultDialog(
        title: 'Programa',
        titleStyle: titleStyle(),
        titlePadding: const EdgeInsets.symmetric(vertical: 20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("¡Procedimiento agendado con éxito!", style: cardTitleStyle()),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                'assets/images/done.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                'A continuación deebes descargar el programa para presentarlo en caja al momento de pagar.'),
            const SizedBox(height: 20),
            ElevatedButton(
                style: accentButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text('Descargar'),
                onPressed: () {
                  downloadFile();
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                }),
            const SizedBox(height: 10),
            TextButton(
                style: textButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text('Cancelar'),
                onPressed: () {
                  Get.back();
                }),
          ],
        ));
  }
}
