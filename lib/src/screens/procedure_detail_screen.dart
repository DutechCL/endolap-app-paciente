import 'package:endolap_paciente_app/src/controllers/ProcedureListController.dart';
import 'package:endolap_paciente_app/src/models/procedure_list2_model.dart';
import 'package:endolap_paciente_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class ProcedureDetailScreen extends StatelessWidget {
	const ProcedureDetailScreen({super.key});

	@override
	Widget build(BuildContext context) {
    ProcedureListController controller = Get.find<ProcedureListController>();

    ProcedureListModel procedure = ModalRoute.of(context)?.settings.arguments as ProcedureListModel;
    final format = DateFormat('dd-MM-yyyy');
    final date = format.format(procedure.date ?? DateTime.now());

    if (procedure.id != null) {
      controller.fetchProcedureDetail(procedure.id ?? 0);
    }
    
		return Scaffold(
			appBar: AppBar(
				title: const Text('Procedimientos'),
			),
			body: Padding(
				padding: const EdgeInsets.all(20),
				child: Container(
					padding: const EdgeInsets.all(20),
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
					child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Detalles del procedimiento", style: titleStyle()),
                const SizedBox(height: 20),

                Text("Datos procedimiento", style: cardTitleStyle()),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.blue, size: 10),
                    const SizedBox(width: 7),
                    Text(procedure.statusMedicalEquipment ?? ""),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
                    const SizedBox(width: 7),
                    Text(procedure.pavilions?.location ?? ""),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.date_range_outlined, color: Color(0xff00d6d6), size: 17),
                    const SizedBox(width: 7),
                    Text(date),
                  ],
                ),
                const SizedBox(height: 5),
                // Row(
                //   children: [
                //     const Icon(Icons.apartment_outlined, color: Color(0xff00d6d6), size: 17),
                //     const SizedBox(width: 7),
                //     Text(procedure.pavilions?.name ?? ""),
                //   ],
                // ),
                // const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined, color: Color(0xff00d6d6), size: 17),
                    const SizedBox(width: 7),
                    Text(procedure.hour ?? ""),
                  ],
                ),

                const SizedBox(height: 20),
                Text("Equipo medico", style: cardTitleStyle()),
                const SizedBox(height: 10),

                Obx(() {
                  if (controller.isLoadingTeam.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Utils().buildTeamMembers(controller.procedureDetail.value.teams);
                }),
              ],
            ),
          ),
				),
			)
		);
	}
}

