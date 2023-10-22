import 'package:endolap_paciente_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProcedureController extends GetxController {
  GlobalKey<FormState> step1FormState = GlobalKey<FormState>();
  GlobalKey<FormState> step2FormState = GlobalKey<FormState>();
  GlobalKey<FormState> step3FormState = GlobalKey<FormState>();

  TextEditingController procedureTypeController = TextEditingController();
  TextEditingController surgeryOptionsController = TextEditingController();
  TextEditingController procedureDateController = TextEditingController();
  TextEditingController procedureTimeController = TextEditingController();

  //Step 3
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var selectedStep = 2.obs;
	var upperBound = 3.obs;
	var currentStep = 1.obs;
	final PageController pageController = PageController();

	List<DropdownMenuItem<int>> getProcedureType() {
		return const [
			DropdownMenuItem(
				value: 1,
				child: Text('Endoscopia'),
			),
			DropdownMenuItem(
				value: 2,
				child: Text('Colonoscopia'),
			),
			DropdownMenuItem(
				value: 3,
				child: Text('Cirugia menor'),
			),
			DropdownMenuItem(
				value: 4,
				child: Text('Cirugia mayor'),
			),
		];
	}

	List<DropdownMenuItem<int>> getSurgeryTypes() {
		return const [
			DropdownMenuItem(
				value: 1,
				child: Text('Colecistectomía'),
			),
			DropdownMenuItem(
				value: 2,
				child: Text('Hernioplastía'),
			),
			DropdownMenuItem(
				value: 3,
				child: Text('Baloón intragástrico elipse'),
			),
			DropdownMenuItem(
				value: 4,
				child: Text('Quiste pilonidal'),
			),
		];
	}

	nextPage(){
		currentStep.value++;

		pageController.nextPage(
			duration: const Duration(milliseconds: 300),
			curve: Curves.easeInOut,
		);
	}

	previousPage(){
		currentStep.value--;

		pageController.previousPage(
			duration: const Duration(milliseconds: 300),
			curve: Curves.easeInOut,
		);
	}

  validateStep1(){
    if(step1FormState.currentState!.validate()){
      nextPage();
    }
  }

  validateStep2(){
    if(step2FormState.currentState!.validate()){
      nextPage();
    }
  }

  validateStep3(){
    if(step3FormState.currentState!.validate()){
      nextPage();
    }
  }

  buildResumeDialog(){
    Get.defaultDialog(
      title: 'Agendar procedimiento',
      titleStyle: titleStyle(),
      titlePadding: const EdgeInsets.symmetric(vertical: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Datos del paciente", style: cardTitleStyle()),
          const SizedBox(height: 10),
          Text('${nameController.text} ${lastNameController.text}'),
          const SizedBox(height: 5),
          const Text('FONASA'),
          const SizedBox(height: 5),
          Text('CI: ${ciController.text}'),

          const SizedBox(height: 20),
          Text("Hora agendada", style: cardTitleStyle()),

          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.place_outlined, color: Color(0xff00d6d6), size: 17),
              SizedBox(width: 7),
              Text('Las Heras 650, Los Andes'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.date_range_outlined, color: Color(0xff00d6d6), size: 17),
              const SizedBox(width: 7),
              Text(procedureDateController.text),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.access_time_outlined, color: Color(0xff00d6d6), size: 17),
              const SizedBox(width: 7),
              Text(procedureTimeController.text),
            ],
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            style: accentButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
            ),
            child: const Text('Agendar'),
            onPressed: () {
              Get.back();
              _successDialog();
            }
          ),
          const SizedBox(height: 10),
          TextButton(
            style: textButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
            ),
            child: const Text('Cancelar'),
            onPressed: (){
              Get.back();
            }
          ),
        ],
      )
    );
  }

  _successDialog(){
		return Get.defaultDialog(
			title: 'Programa',
			titleStyle: titleStyle(),
			titlePadding: const EdgeInsets.symmetric(vertical: 20),
			contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
			content: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text("¡Procedimiento agendado con éxito!", style: cardTitleStyle()),
					const SizedBox(height: 10),

					Center(
						child: Image.asset('assets/images/done.png', width: 200, height: 200,),
					),

					const SizedBox(height: 10),
					const Text('A continuación deebes descargar el programa para presentarlo en caja al momento de pagar.'),

					const SizedBox(height: 20),
					ElevatedButton(
						style: accentButtonStyle().copyWith(
							minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
						),
						child: const Text('Descargar'),
						onPressed: () {
							Get.back();
							Get.back();
						}
					),
					const SizedBox(height: 10),
					TextButton(
						style: textButtonStyle().copyWith(
							minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
						),
						child: const Text('Cancelar'),
						onPressed: (){
							Get.back();
						}
					),
				],
			)
		);
	}
}