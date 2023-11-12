import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationItemListWidget extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItemListWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd-MM-yyyy');

    return GestureDetector(
      onTap: () {
        // Get.toNamed('/procedure-detail');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.alarm, color: Color(0xff00d6d6), size: 18),
                    const SizedBox(width: 7),
                    Text(notification.data?.title ?? '', style: cardTitleStyle().copyWith(color: const Color(0xff00d6d6))),
                  ],
                ),

                Text("23 min", style: TextStyle(color: Colors.grey[400], fontSize: 12))
              ],
            ),
            const SizedBox(height: 7),
            const Text("Agendaste con éxito un procedimiento para el día 29/05/23")
          ],
        ),
      ),
    );
  }
}