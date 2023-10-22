import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:endolap_paciente_app/src/controllers/NewProcedureController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:intl/intl.dart';
import 'package:progress_bar_steppers/steppers.dart';

import '../constants.dart';

class NewProcedureScreen extends StatelessWidget {
	const NewProcedureScreen({super.key});

	@override
	Widget build(BuildContext context) {
		NewProcedureController controller = NewProcedureController();
		final size = MediaQuery.of(context).size;

		return Scaffold(
			appBar: AppBar(
				title: const Text('Agendar procedimiento'),
			),
			body: Padding(
				padding: const EdgeInsets.all(20),
				child: Column(
					children: [
						Obx(() => Steppers(
							currentStep: controller.currentStep.value,
							direction: StepperDirection.horizontal,
							stepBarStyle: StepperStyle(
								activeColor: const Color(0xff00d6d6),
							),
							labels: [
								StepperData(
									label: "Datos clínicos",
								),
								StepperData(
									label: "Fecha y hora",
								),
								StepperData(
									label: "Datos personales",
								),
							],
						)),

						ExpandablePageView(
							controller: controller.pageController,
							allowImplicitScrolling: true,
							estimatedPageSize: size.height * 0.8,
							children: [
								SingleChildScrollView(
									primary: true,
									child: _buildStepContent(context, controller, 0),
								),
								SingleChildScrollView(
									primary: true,
									child: _buildStepContent(context, controller, 1),
								),
								SingleChildScrollView(
									primary: true,
									child: _buildStepContent(context, controller, 2),
								),
							],
						)
					],
				),
			)
		);
	}
}

	Widget _buildStepContent(BuildContext context, NewProcedureController controller, int index) {
		switch (index) {
			case 0:
				return _buildStep1(controller);
			case 1:
				return _buildStep2(controller);
			case 2:
				return _buildStep3(controller);
			default:
				return Container();
		}
	}

	Widget _buildStep1(controller) {
		return Form(
      key: controller.step1FormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const SizedBox(height: 20),

                const Text('Tipo de procedimiento'),
                const SizedBox(height: 5),

                DropdownButtonFormField(
                  onChanged: (value) => controller.procedureTypeController.text = value.toString(),
                  decoration: formFieldStyle().copyWith(
                    labelText: 'Seleccione una opción',
                  ),
                  items: controller.getProcedureType(),
                  validator: (value) {
                    if (value == null) {
                      return 'Seleccione una opción';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                const Text('Opciones de cirugías'),
                const SizedBox(height: 5),

                DropdownButtonFormField(
                  onChanged: (value) => controller.surgeryOptionsController.text = value.toString(),
                  decoration: formFieldStyle().copyWith(
                    labelText: 'Seleccione una opción',
                  ),
                  items: controller.getSurgeryTypes(),
                  validator: (value) {
                    if (value == null) {
                      return 'Seleccione una opción';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                
                ElevatedButton(
                  style: accentButtonStyle().copyWith(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                  ),
                  child: const Text('Continuar'),
                  onPressed: () => controller.validateStep1()
                ),
            ],
          ),
        ],
      ),
    );
	}
	
	Widget _buildStep2(controller) {
		final horario = ['08:00', '09:00', '10:00', '11:00', '12:00', '13:00'];
		var showHorarios = List<Widget>.empty(growable: true);

		for (var element in horario) {
			showHorarios.add(
				OutlinedButton(
					style: outlineButtonStyle(),
					child: Text(element),
					onPressed: () {
					},
				)
			);
		}

		return Form(
      key: controller.step2FormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					const Text('Seleccione el día'),
					const SizedBox(height: 5),
					Card(
						elevation: 3,
						child: CalendarDatePicker2(
							config: CalendarDatePicker2Config(),
							value: [DateTime.now()],
              onValueChanged: (value) => controller.procedureDateController.text = value.toString(),
						),
					),

					const SizedBox(height: 20),

					const Text('Seleccione una hora disponible'),
					const SizedBox(height: 5),
					
					Wrap(
						runSpacing: 10,
						spacing: 10,
						children: showHorarios,					
					),

					const SizedBox(height: 20),
					ElevatedButton(
						style: accentButtonStyle().copyWith(
							minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
						),
						child: const Text('Continuar'),
						onPressed: () => controller.validateStep2()
					),
				],
			),
		);
	}
	
	Widget _buildStep3(controller) {
		return Form(
      key: controller.step3FormState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nombre'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su nombre';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text('Apellido'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.lastNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su apellido';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text('Cédula de identidad*'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.ciController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su cédula de identidad';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text('Fecha de nacimiento'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.birthDateController,
            onTap: () => _showDialog(
              CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (DateTime newDate) {
                  controller.birthDateController.text = DateFormat('dd-MM-yyyy').format(newDate);
                },
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su fecha de nacimiento';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          const Text('Número de contacto'),
          const SizedBox(height: 5),
          TextFormField(
            decoration: formFieldStyle(),
            controller: controller.phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su número de contacto';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            style: accentButtonStyle().copyWith(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
            ),
            child: const Text('Continuar'),
            onPressed: () => controller.buildResumeDialog()
          ),
        ],
      ),
    );
	}

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

	
