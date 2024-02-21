import 'package:endolap_paciente_app/src/controllers/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:get/get.dart';
import 'package:endolap_paciente_app/src/models/prevision_model.dart';

class MedicTabProfileWidget extends StatelessWidget {
  final ProfileController controller;
  const MedicTabProfileWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.setUser();

    return Form(
      key: controller.medicFormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Previsión médica'),
          const SizedBox(height: 10),
          Obx(() => DropdownButtonFormField<PrevisionTypeModel>(
                onChanged: (value) =>
                    controller.selectedPrevisionType.value = value!,
                decoration: formFieldStyle().copyWith(
                  labelText: 'Seleccione una opción',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
                items: controller.previsionOptions.value
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name!),
                        ))
                    .toList(),
                value: (controller.selectedPrevisionType.value.id == null)
                    ? null
                    : controller.selectedPrevisionType.value,
              )),
          const SizedBox(height: 20),
          Obx(() => _buildRadioGroup(controller.hasChronicDisease.value,
                  "¿Padece alguna enfermedad crónica?", onChanged: (value) {
                controller.hasChronicDisease.value = value;
                if (value) {
                  // Aquí puedes realizar acciones adicionales si se selecciona "Sí"
                }
              })),

          Obx(() {
            return Visibility(
              visible: controller.hasChronicDisease.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: formFieldStyle().copyWith(),
                    controller: controller.chronicDiseaseController,
                    validator: (value) {
                      if (value!.isEmpty &&
                          controller.hasChronicDisease.value) {
                        return 'Por favor ingrese su enfermedad crónica';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),

          Obx(() => _buildRadioGroup(
              controller.haveMedication.value, "Ingiere algún medicamento?",
              onChanged: (value) => controller.haveMedication.value = value)),
          Obx(() {
            return Visibility(
              visible: controller.haveMedication.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: formFieldStyle().copyWith(),
                    controller: controller.medicationController,
                    validator: (value) {
                      if (value!.isEmpty && controller.haveMedication.value) {
                        return 'Por favor ingrese el medicamento';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),

          Obx(() => _buildRadioGroup(
              controller.hasSurgery.value, "¿Posee antecedentes quirúrgicos?",
              onChanged: (value) => controller.hasSurgery.value = value)),
          Obx(() {
            return Visibility(
              visible: controller.hasSurgery.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: formFieldStyle().copyWith(),
                    controller: controller.surgeryController,
                    validator: (value) {
                      if (value!.isEmpty && controller.hasSurgery.value) {
                        return 'Por favor ingrese la cirugía';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),

          Obx(() => _buildRadioGroup(
              controller.hasAllergy.value, "¿Sufre de alguna alergia?",
              onChanged: (value) => controller.hasAllergy.value = value)),
          Obx(() {
            return Visibility(
              visible: controller.hasAllergy.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: formFieldStyle().copyWith(),
                    controller: controller.allergyController,
                    validator: (value) {
                      if (value!.isEmpty && controller.hasAllergy.value) {
                        return 'Por favor ingrese la alergia';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
          // const SizedBox(height: 20),
          const Text('Grupo sanguineo'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle().copyWith(),
            controller: controller.bloodGroup,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su grupo sanguineo';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: outlineButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 5)),
            ),
            onPressed: () {
              controller.updateUser();
            },
            child: const Text('Guardar', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}

Widget _buildRadioGroup(bool groupValue, String title,
    {required Function(bool) onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      const SizedBox(height: 10),
      Row(
        children: [
          Radio.adaptive(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: true,
            groupValue: groupValue,
            onChanged: (value) => onChanged(true),
          ),
          const Text("Sí"),
          const SizedBox(width: 20),
          Radio.adaptive(
            value: false,
            groupValue: groupValue,
            onChanged: (value) => onChanged(false),
          ),
          const Text("No"),
        ],
      ),
    ],
  );
}
