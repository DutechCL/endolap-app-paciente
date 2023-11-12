import 'package:endolap_paciente_app/src/controllers/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

	@override
	Widget build(BuildContext context) {
		// ignore: unused_local_variable
		SplashController controller = Get.put(SplashController());

		return Scaffold(
			body: Center(
				child: Image.asset(
					'assets/images/logo-endolap.jpg',
					height: 200,
				),
			),
		);
	}
}