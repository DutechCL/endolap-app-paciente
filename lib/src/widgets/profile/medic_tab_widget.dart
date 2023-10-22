import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';

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