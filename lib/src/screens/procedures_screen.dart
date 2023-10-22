import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:endolap_paciente_app/src/controllers/ProcedureListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ProcedureScreen extends StatelessWidget {
	ProcedureScreen({super.key});
	final ProcedureListController controller = Get.put(ProcedureListController());

	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				appBar: AppBar(
					title: const Text('Mis procedimiento'),
				),
				body: DefaultTabController(
					length: 2,
					child: Stack(
						children: [
							const Padding(
								padding: EdgeInsets.all(16),
								child: SegmentedTabControl(
									indicatorColor: Color(0xff00d6d6),
									backgroundColor: Color(0xfff5f5f5),
									tabTextColor: Color(0xff777777),
									tabs: [
										SegmentTab(
											label: 'Pendientes',
										),
										SegmentTab(
											label: 'Realizados',
										),
									],
								),
							),

							Padding(
								padding: const EdgeInsets.only(top: 70),
								child: TabBarView(
									physics: const BouncingScrollPhysics(),
									children: [
										SampleWidget(
											label: 'FIRST PAGE',
											color: Colors.red.shade200,
										),
										ProcedureDoneWidget(
											label: 'SECOND PAGE',
											color: Colors.blue.shade100,
										),
									],
								),
							),
						],
					)
				)
			)
		);
	}
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
			child: ListView.builder(
				padding: const EdgeInsets.all(20),
				itemCount: 20,
				itemBuilder: (context, index) {
					return Container(
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
								Text('Procedimiento $index', style: cardTitleStyle()),
								const SizedBox(height: 7),

								const Row(
									children: [
										Icon(Icons.monitor_heart_outlined, color: Color(0xff00d6d6), size: 17),
										SizedBox(width: 7),
										Text('Hernioplastía'),
									],
								),
								
								const SizedBox(height: 10),
								const Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										Row(
											children: [
												Icon(Icons.date_range_outlined, color: Color(0xff00d6d6), size: 17),
												SizedBox(width: 7),
												Text('01/01/2021'),
											],
										),

										Row(
											children: [
												Icon(Icons.access_time_outlined, color: Color(0xff00d6d6), size: 17),
												SizedBox(width: 7),
												Text('10:45'),
											],
										),

										Row(
											children: [
												Icon(Icons.circle, color: Colors.green, size: 10),
												SizedBox(width: 7),
												Text('Confirmada'),
											],
										),
									],
								),
							
								const SizedBox(height: 10),

								const Row(
									children: [
										Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
										SizedBox(width: 7),
										Text('Las Heras 650, Los Andes'),
									],
								),
							],
						),
					);
				},
			),
		);
  }
}
class ProcedureDoneWidget extends StatelessWidget {
  const ProcedureDoneWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
			child: ListView.builder(
				padding: const EdgeInsets.all(20),
				itemCount: 20,
				itemBuilder: (context, index) {
					return Container(
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
								Text('Datos procedimiento', style: cardTitleStyle()),
								const SizedBox(height: 7),

								const Row(
									children: [
										Icon(Icons.circle, color: Colors.green, size: 10),
										SizedBox(width: 7),
										Text('Confirmada'),
									],
								),

								const SizedBox(height: 10),

								const Row(
									children: [
										Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
										SizedBox(width: 7),
										Text('Las Heras 650, Los Andes'),
									],
								),

								const SizedBox(height: 10),
								const Row(
									children: [
										Icon(Icons.date_range_outlined, color: Color(0xff00d6d6), size: 17),
										SizedBox(width: 7),
										Text('01/01/2021'),
									],
								),

								const SizedBox(height: 10),
								const Row(
									children: [
										Icon(Icons.access_time_outlined, color: Color(0xff00d6d6), size: 17),
										SizedBox(width: 7),
										Text('10:45'),
									],
								),

								const SizedBox(height: 10),
								Text("Equipo médico", style: cardTitleStyle()),
								const SizedBox(height: 7),

								const Row(
									children: [
										Text('Médico:'),
										SizedBox(width: 7),
										Text('Dr. Juan Pérez'),
									],
								),
								const SizedBox(height: 7),
								const Row(
									children: [
										Text('TENS 1:'),
										SizedBox(width: 7),
										Text('Cesar Orellana'),
									],
								),
								const SizedBox(height: 7),
								const Row(
									children: [
										Text('TENS 2:'),
										SizedBox(width: 7),
										Text('Carlos Guerra'),
									],
								),
								const SizedBox(height: 7),
								const Row(
									children: [
										Text('Enfermera:'),
										SizedBox(width: 7),
										Text('Camila Vargas'),
									],
								),
								const SizedBox(height: 7),
								const Row(
									children: [
										Text('Auxiliar:'),
										SizedBox(width: 7),
										Text('Pablo Cortés'),
									],
								),
								const SizedBox(height: 7),
								const Row(
									children: [
										Text('Secretaria:'),
										SizedBox(width: 7),
										Text('Martina López'),
									],
								),
								
							],
						),
					);
				},
			),
		);
  }
}