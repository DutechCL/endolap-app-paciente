import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/models/procedure_list2_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProcedureItemListWidget extends StatelessWidget {
  final ProcedureListModel procedure;
  final bool isExpanded;
  final Function(bool) onExpandToggle;
  const ProcedureItemListWidget({super.key, required this.procedure, required this.isExpanded, required this.onExpandToggle});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd-MM-yyyy');
    final date = format.format(procedure.date ?? DateTime.now());

    return GestureDetector(
      onTap: () {
        Get.toNamed('/procedure-detail', arguments: procedure);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: const EdgeInsets.only(bottom: 23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: -4,
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(procedure.procedures?.name ?? '', style: cardTitleStyle()),
            const SizedBox(height: 7),

            Row(
              children: [
                const Icon(Icons.monitor_heart_outlined, color: Color(0xff00d6d6), size: 17),
                const SizedBox(width: 7),
                Text(procedure.types?.name ?? ''),
              ],
            ),
            
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range_outlined, color: Color(0xff00d6d6), size: 17),
                    const SizedBox(width: 7),
                    Text(date),
                  ],
                ),

                Row(
                  children: [
                    const Icon(Icons.access_time_outlined, color: Color(0xff00d6d6), size: 17),
                    const SizedBox(width: 7),
                    Text(procedure.hour ?? ''),
                  ],
                ),

                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.blue, size: 10),
                    const SizedBox(width: 7),
                    Text(procedure.statusMedicalEquipment ?? ""),
                  ],
                ),
              ],
            ),
          
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
                const SizedBox(width: 7),
                Text(procedure.pavilions?.location ?? ''),
              ],
            ),

            if (isExpanded) ...[
              const SizedBox(height: 10),
              const Text("Información adicional"),
              // Aquí puedes agregar más widgets con la información adicional que deseas mostrar
            ]
          ],
        ),
      ),
    );
  }
}