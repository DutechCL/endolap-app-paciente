import 'package:endolap_paciente_app/src/controllers/NewProcedureController.dart';
import 'package:endolap_paciente_app/src/widgets/procedures/procedure_step1_widget.dart';
import 'package:endolap_paciente_app/src/widgets/procedures/procedure_step2_widget.dart';
import 'package:endolap_paciente_app/src/widgets/procedures/procedure_step3_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:progress_bar_steppers/steppers.dart';

class NewProcedureScreen extends StatelessWidget {
	const NewProcedureScreen({super.key});

	@override
	Widget build(BuildContext context) {
		NewProcedureController controller = Get.put(NewProcedureController());
		final size = MediaQuery.of(context).size;

		return Scaffold(
			appBar: AppBar(
				title: const Text('Agendar procedimiento'),
			),
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(20),
				child: Column(
					children: [
						Obx(() => Steppers(
							currentStep: controller.currentStep.value,
							direction: StepperDirection.horizontal,
							stepBarStyle: StepperStyle(
								activeColor: const Color(0xff00d6d6),
							),
							labels: [
								StepperData(
									label: "Datos clínicos",
								),
								StepperData(
									label: "Fecha y hora",
								),
								StepperData(
									label: "Datos personales",
								),
							],
						)),

						ExpandablePageView(
							controller: controller.pageController,
							allowImplicitScrolling: true,
							estimatedPageSize: size.height * 0.8,
							children: [
								SingleChildScrollView(
									primary: true,
									child: ProcedureStep1Widget(),
								),
								SingleChildScrollView(
									primary: true,
									child: ProcedureStep2Widget(),
								),
								SingleChildScrollView(
									primary: true,
									child: ProcedureStep3Widget(),
								),
							],
						)
					],
				),
			)
		);
	}
}
	
