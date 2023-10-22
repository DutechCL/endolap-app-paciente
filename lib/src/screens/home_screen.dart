import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
			),
			body: Container(
				padding: const EdgeInsets.all(20),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Image.asset('assets/images/doctors.png', width: 400, height: 400,),

						Text('Hola Daniel!', style: titleStyle()),

						const SizedBox(height: 20),
						const Text("En Endolap estamos para ayudarte, cuentanos ¿Qué estás buscando hoy?"),
						const SizedBox(height: 40),

						ElevatedButton.icon(
							style: primaryButtonStyle().copyWith(
								minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
							),
							icon: const Icon(Icons.date_range_outlined),
							label: const Text('Agendar procedimiento'),
							onPressed: () {
								Get.toNamed('/new_procedure');
							},
						)
					],
				),
			),
		);
	}
}