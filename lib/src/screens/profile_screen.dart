import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:endolap_paciente_app/src/controllers/ProfileController.dart';
import 'package:endolap_paciente_app/src/widgets/profile/account_tab_widget.dart';
import 'package:endolap_paciente_app/src/widgets/profile/medic_tab_widget.dart';
import 'package:endolap_paciente_app/src/widgets/profile/personal_data_tab_widget.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
	ProfileScreen({super.key});
	ProfileController controller = Get.put(ProfileController());
  AuthController authController = Get.put(AuthController());

	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				appBar: AppBar(
					title: const Text('Perfil'),
					actions: [
						IconButton(
							icon: const Icon(Icons.settings_outlined),
							onPressed: () => Get.toNamed('/settings'),
						)					
					],
				),
				body: Column(
					children: [
						_buildHeader(controller),

						Container(
							padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
							child: SegmentedTabControl(
								controller: controller.tabController,
								indicatorColor: const Color(0xff00d6d6),
								backgroundColor: const Color(0xfff5f5f5),
								tabTextColor: const Color(0xff777777),
								tabs: const [
									SegmentTab(
										label: 'Cuenta',
									),
									SegmentTab(
										label: 'Datos personales',
									),
									SegmentTab(
										label: 'Ficha médica',
									),
								],
							),
						),

						ExpandablePageView(
							controller: controller.pageController,
							children: [
								SingleChildScrollView(
									padding: const EdgeInsets.symmetric(horizontal: 20),
									child: AccountTabWidget(controller: authController),
								),
								SingleChildScrollView(
									padding: const EdgeInsets.symmetric(horizontal: 20),
									child: PersonalDataTabWidget(controller: authController),
								),
								SingleChildScrollView(
									padding: const EdgeInsets.symmetric(horizontal: 20),
									child: MedicTabWidget(controller: authController),
								),
							],
						),
					],
				),
			)
		);
	}

  _buildHeader(ProfileController controller){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daniel Palma', style: TextStyle(fontSize: 20, color: Color(0xff007eb9), fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.email_outlined, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('daniel.palma@gmail.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('+56959592626', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: outlineButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 5)),
            ),
            onPressed: () {
              
            },
            child: const Text('Editar perfil', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}