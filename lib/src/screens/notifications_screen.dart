import 'package:endolap_paciente_app/src/controllers/NotificationController.dart';
import 'package:endolap_paciente_app/src/widgets/notifications/notification_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class NotificationScreen extends StatelessWidget {
	NotificationScreen({super.key});
  final NotificationController controller = Get.put(NotificationController());

	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				appBar: AppBar(
					title: const Text('Notificaciones'),
				),
				body: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 20),
							child: Text("Hoy", style: cardTitleStyle()),
						),

						Expanded(
							child: NotificationListWidget(controller: controller, list: controller.notifications.value.where((element) => element.readAt == null).toList()),
						)
						
					],
				),
			)
		);
	}
}