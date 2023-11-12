import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/controllers/NewProcedureController.dart';
import 'package:endolap_paciente_app/src/models/procedure_type_model.dart';
import 'package:endolap_paciente_app/src/models/sugery_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcedureStep1Widget extends StatelessWidget {
  final controller = Get.find<NewProcedureController>();
  ProcedureStep1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			mainAxisSize: MainAxisSize.max,
			children: [
				Form(
          key: controller.step1FormState,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),

              const Text('Tipo de procedimiento'),
              const SizedBox(height: 5),

              Obx(() => DropdownButtonFormField<ProcedureTypeModel>(
                onChanged: (value) => controller.selectedProcedureType.value = value!,
                decoration: formFieldStyle().copyWith(
                  labelText: 'Seleccione una opción',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                items: controller.procedureTypes.value.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name!),
                )).toList(),
                value: (controller.selectedProcedureType.value.id == null) ? null : controller.selectedProcedureType.value,
              )),

              const SizedBox(height: 20),

              const Text('Opciones de cirugías'),
              const SizedBox(height: 5),

              Obx(() => DropdownButtonFormField<SugeryTypeModel>(
                onChanged: (value) => controller.selectedSugeryTupe.value = value!,
                decoration: formFieldStyle().copyWith(
                  labelText: 'Seleccione una opción',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                items: controller.surgeryOptions.value.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name!),
                )).toList(),
                value: (controller.selectedSugeryTupe.value.id == null) ? null : controller.selectedSugeryTupe.value,
              )),

              const SizedBox(height: 20),
              
              ElevatedButton(
                style: accentButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                ),
                child: const Text('Continuar'),
                onPressed: () => controller.validateStep1()
              ),
            ],
          ),
        ),
			],
		);
  }
}