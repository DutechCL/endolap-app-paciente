import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
	const SettingsScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final decoration = BoxDecoration(
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
		);

		final textColor = Colors.grey[600];

		return Scaffold(
			appBar: AppBar(
				title: const Text('Ajustes'),
			),
			body: ListView(
				padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
				children: [
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
						margin: const EdgeInsets.only(bottom: 23),
						decoration: decoration,
						child: Row(
							children: [
								Icon(Icons.file_copy_rounded, color: textColor),
								const SizedBox(width: 10),
								Text('Términos y condiciones', style: TextStyle(color: textColor)),
							],
						),
					),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
						margin: const EdgeInsets.only(bottom: 23),
						decoration: decoration,
						child: Row(
							children: [
								Icon(Icons.report_problem_outlined, color: textColor),
								const SizedBox(width: 10),
								Text('Reportar un problema', style: TextStyle(color: textColor)),
							],
						),
					),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
						margin: const EdgeInsets.only(bottom: 23),
						decoration: decoration,
						child: Row(
							children: [
								Icon(Icons.security_rounded, color: textColor),
								const SizedBox(width: 10),
								Text('Políticas de privacidad', style: TextStyle(color: textColor)),
							],
						),
					),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
						margin: const EdgeInsets.only(bottom: 23),
						decoration: decoration,
						child: Row(
							children: [
								Icon(Icons.logout_rounded, color: textColor),
								const SizedBox(width: 10),
								Text('Cerrar sesión', style: TextStyle(color: textColor)),
							],
						),
					),
				],
			)
		);
	}
}