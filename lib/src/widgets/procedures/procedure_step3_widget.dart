import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/controllers/NewProcedureController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProcedureStep3Widget extends StatelessWidget {
  final controller = Get.find<NewProcedureController>();
  ProcedureStep3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.step3FormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nombre'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
            enabled: false,
          ),

          const SizedBox(height: 20),

          const Text('Apellido'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.lastNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su apellido';
              }
              return null;
            },
            enabled: false,
          ),

          const SizedBox(height: 20),

          const Text('Cédula de identidad*'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.ciController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su cédula de identidad';
              }
              return null;
            },
            enabled: false,
          ),

          const SizedBox(height: 20),

          const Text('Fecha de nacimiento'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.birthDateController,
            onTap: () => _showDialog(
              CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (DateTime newDate) {
                  controller.birthDateController.text = DateFormat('dd-MM-yyyy').format(newDate);
                },
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su fecha de nacimiento';
              }
              return null;
            },
            enabled: false,
          ),

          const SizedBox(height: 20),

          const Text('Número de contacto'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su número de contacto';
              }
              return null;
            },
            enabled: false,
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            style: accentButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
            ),
            child: const Text('Continuar'),
            onPressed: () => controller.buildResumeDialog()
          ),
        ],
      ),
    );
  }
}

void _showDialog(Widget child) {
  showCupertinoModalPopup<void>(
    context: Get.context!,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}