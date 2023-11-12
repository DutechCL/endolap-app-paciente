import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalDataTabWidget extends StatelessWidget {
  final AuthController controller;
	const PersonalDataTabWidget({super.key, required this.controller});

	@override
	Widget build(BuildContext context) {
		return Form(
      key: controller.personalDataFormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nombre'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(hintText: "Daniel Benjamin"),
            controller: controller.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          const Text('Apellido'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(hintText: "Palma Alvarez"),
            controller: controller.lastNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su apellido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          const Text('Cédula de indentidad*'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(hintText: "19226226-2n"),
            controller: controller.ciController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su cédula de identidad';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          const Text('Fecha de nacimiento'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(hintText: "15 - 02 - 1998"),
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
          ),
          const SizedBox(height: 20),

          const Text('Número de contacto'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(hintText: "95959262"),
            controller: controller.phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su número de contacto';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Submit
          ElevatedButton(
            style: accentButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
              elevation: MaterialStateProperty.all<double>(0),
            ),
            child: const Text("Continuar"),
            onPressed: () => controller.validatePersonalDataTab(),
          ),
        ],
      ),
    );
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
}