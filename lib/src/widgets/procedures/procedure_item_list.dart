import 'package:endolap_coordinador_app/src/constants.dart';
import 'package:endolap_coordinador_app/src/models/procedure_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcedureItemListWidget extends StatelessWidget {
  final ProcedureModel procedure;
  const ProcedureItemListWidget({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/procedure-detail'),
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
            Text(procedure.name ?? '', style: cardTitleStyle()),
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
                    Icon(Icons.circle, color: Colors.blue, size: 10),
                    SizedBox(width: 7),
                    Text('Realizado'),
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
      ),
    );
  }
}