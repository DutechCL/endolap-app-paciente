import 'package:endolap_paciente_app/src/controllers/TabController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TabsController>(
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.currentIndex,
				onTap: (i) => controller.setCurrentIndex(i),
				type: BottomNavigationBarType.fixed,
				backgroundColor: Colors.white,
				selectedItemColor: const Color(0xff00d6d6),
				unselectedItemColor: const Color(0xff777777),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'Procedimiento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}