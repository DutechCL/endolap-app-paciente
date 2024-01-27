import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/controllers/NewProcedureController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProcedureStep2Widget extends StatelessWidget {
  final controller = Get.find<NewProcedureController>();
  ProcedureStep2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.step2FormState,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Seleccione el día'),
            const SizedBox(height: 5),
            Obx(() {
              if (controller.isReadOnly.value) {
                return Row(
                  children: [
                    Icon(Icons.date_range_outlined,
                        color: primaryColor(), size: 17),
                    const SizedBox(width: 7),
                    Chip(
                        label: Text(
                            DateFormat('dd/MM/yyyy')
                                .format(controller.selectedDate.value),
                            style: const TextStyle(color: Colors.white)),
                        backgroundColor: primaryColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))
                  ],
                );
              }

              return Card(
                elevation: 3,
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    firstDate: DateTime.now(),
                  ),
                  value: [controller.selectedDate.value],
                  onValueChanged: (value) {
                    controller.selectedDate.value = value[0]!;

                    DateFormat formatter = DateFormat('yyyy-MM-dd');

                    controller.fetchShedule(
                        formatter.format(controller.selectedDate.value));
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            const Text('Seleccione una hora disponible'),
            const SizedBox(height: 5),
            Obx(() {
              if (controller.isSheduleLoading.value == true) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.isReadOnly.value) {
                return Row(
                  children: [
                    Icon(Icons.access_time_outlined,
                        color: primaryColor(), size: 17),
                    const SizedBox(width: 7),
                    Chip(
                        label: Text(
                            DateFormat('dd/MM/yyyy')
                                .format(controller.selectedDate.value),
                            style: const TextStyle(color: Colors.white)),
                        backgroundColor: primaryColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))
                  ],
                );
              }

              if (controller.shedule.value.isNotEmpty) {
                return ChipsChoice<String>.single(
                  value: controller.selectedHour.value,
                  wrapped: true,
                  choiceStyle: C2ChipStyle.outlined(
                    selectedStyle: C2ChipStyle.filled(),
                  ),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: controller.shedule.value,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                  onChanged: (val) {
                    controller.selectedHour.value = val;
                  },
                );
              } else {
                return const Center(child: Text('No hay horas disponibles'));
              }
            }),
            const SizedBox(height: 15),
            const SizedBox(height: 20),
            ElevatedButton(
                style: accentButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                child: const Text('Continuar'),
                onPressed: () => controller.validateStep2()),
          ],
        ),
      ),
    );
  }
}
