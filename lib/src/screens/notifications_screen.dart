import 'package:flutter/material.dart';

import '../constants.dart';

class NotificationScreen extends StatelessWidget {
	const NotificationScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				appBar: AppBar(
					title: const Text('Notification'),
				),
				body: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Padding(
							padding: EdgeInsets.symmetric(horizontal: 20),
							child: Text("Hoy", style: cardTitleStyle()),
						),

						Expanded(
							child: ListView.builder(
								physics: const NeverScrollableScrollPhysics(),
								shrinkWrap: true,
								itemCount: 3,
								padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: [
														Row(
															children: [
																Icon(Icons.alarm, color: const Color(0xff00d6d6), size: 18),
																const SizedBox(width: 7),
																Text('Procedimiento $index agendado', style: cardTitleStyle().copyWith(color: const Color(0xff00d6d6))),
															],
														),

														Text("23 min", style: TextStyle(color: Colors.grey[400], fontSize: 12))
													],
												),
												const SizedBox(height: 7),
												const Text("Agendaste con éxito un procedimiento para el día 29/05/23")
											],
										),
									);
								}							
							),
						)
						
					],
				),
			)
		);
	}
}