import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/controllers/TabController.dart';
import 'package:endolap_paciente_app/src/widgets/navigation_widget.dart';
import 'package:endolap_paciente_app/src/screens/index.dart';
import 'package:get/get.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: const NavigationWidget(),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabsController tabController = Get.put(TabsController());

    return PageView(
      controller: tabController.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const HomeScreen(),
        ProcedureScreen(),
        const NotificationScreen(),
        ProfileScreen(),
      ],
    );
  }
}