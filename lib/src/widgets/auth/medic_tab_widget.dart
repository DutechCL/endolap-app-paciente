import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:get/get.dart';

class MedicTabWidget extends StatelessWidget {
  final AuthController controller;
	const MedicTabWidget({super.key, required this.controller});

	@override
	Widget build(BuildContext context) {
		return Form(
      key: controller.medicFormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Previsión médica'),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            onChanged: (value) => controller.medicalInsuranceController.text = value.toString(),
            validator: (value) {
              if (value == null) {
                return 'Por favor seleccione una opción';
              }
              return null;
            },
            decoration: formFieldStyle().copyWith(
              labelText: 'Seleccione una opción',
            ),
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text('FONASA'),
              ),
            ]
          ),
          const SizedBox(height: 20),

          Obx(() => _buildRadioGroup(controller.hasChronicDisease.value, "¿Padece alguna enfermedad crónica?", 
            onChanged: (value) => controller.hasChronicDisease.value = value
          )),

          Obx(() => _buildRadioGroup(controller.hasChronicDisease.value, "Ingiere algún medicamento?", 
            onChanged: (value) => controller.haveMedication.value = value
          )),

          Obx(() => _buildRadioGroup(controller.hasChronicDisease.value, "¿Posee antecedentes quirúrgicos?", 
            onChanged: (value) => controller.hasSurgery.value = value
          )),

          Obx(() => _buildRadioGroup(controller.hasChronicDisease.value, "¿Sufre de alguna alergia?",
            onChanged: (value) => controller.hasAllergy.value = value
          )),

          // Submit
          ElevatedButton(
            style: accentButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
              elevation: MaterialStateProperty.all<double>(0),
            ),
            child: const Text("Continuar"),
            onPressed: () => controller.validateMedicTab(),
          ),
        ],
      ),
    );
	}
}

_buildRadioGroup(int groupValue, String title, {required Function onChanged}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),

      const SizedBox(height: 10),

      Row(
        children: [
          Radio.adaptive(
            value: 1,
            groupValue: groupValue,
            onChanged: (value) => onChanged,
          ),
          const Text("Sí"),

          const SizedBox(width: 20),

          Radio.adaptive(
            value: 0,
            groupValue: groupValue,
            onChanged: (value) => onChanged,
          ),
          const Text("No"),
        ],
      ),

      const SizedBox(height: 30),
    ],
  );
}