import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:get/get.dart';

class AccountTabWidget extends StatelessWidget {
  final AuthController controller;
	const AccountTabWidget({super.key, required this.controller});

	@override
	Widget build(BuildContext context) {
		return SingleChildScrollView(
      child: Form(
        key: controller.accountFormState,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Correo'),
            const SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              decoration: formFieldStyle(),
              validator: (value) {
                if (GetUtils.isEmail(value!)) {
                  return null;
                }
                
                return 'Por favor ingrese un correo válido';
              },
            ),
            const SizedBox(height: 20),
            
            const Text('Contraseña'),
            const SizedBox(height: 5),
            TextFormField(
              obscureText: true,
              controller: controller.passwordController,
              decoration: formFieldStyle().copyWith(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {},
                )
              ),
              validator: (value) {
                if (!GetUtils.isLengthGreaterOrEqual(value!, 6)) {
                  return 'Por favor ingrese su contraseña (mínimo 6 caracteres)';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            const Text('Repetir contraseña'),
            const SizedBox(height: 5),
            TextFormField(
              obscureText: true,
              controller: controller.confirmPasswordController,
              decoration: formFieldStyle().copyWith(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {},
                )
              ),
              validator: (value) {
                if (!GetUtils.isLengthGreaterOrEqual(value!, 6)) {
                  return 'Por favor ingrese su contraseña (mínimo 6 caracteres)';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                // Remember me
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text("Acepto términos y condiciones"),
              ],
            ),
            const SizedBox(height: 30),

            // Submit
            ElevatedButton(
              style: accentButtonStyle().copyWith(
                minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: const Text("Continuar"),
              onPressed: () => controller.validateAccountTab(),
            ),
          ],
        )
      ),
    );
	}
}