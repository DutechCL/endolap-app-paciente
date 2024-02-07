import 'package:endolap_paciente_app/src/controllers/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:endolap_paciente_app/src/constants.dart';
import 'package:get/get.dart';

class AccountTabProfileWidget extends StatelessWidget {
  final ProfileController controller;
  const AccountTabProfileWidget({super.key, required this.controller});

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
              ObxValue(
                  (p0) => TextFormField(
                        decoration: formFieldStyle().copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(p0.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => p0.toggle(),
                          ),
                        ),
                        controller: controller.passwordController,
                        obscureText: p0.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                  false.obs),
              const SizedBox(height: 20),
              const Text('Repetir contraseña'),
              const SizedBox(height: 5),
              ObxValue(
                  (p0) => TextFormField(
                        decoration: formFieldStyle().copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(p0.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => p0.toggle(),
                          ),
                        ),
                        controller: controller.confirmPasswordController,
                        obscureText: p0.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                  false.obs),
              const SizedBox(height: 20),
              OutlinedButton(
                style: outlineButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 5)),
                ),
                onPressed: () {
                  controller.updateUser();
                },
                child:
                    const Text('Guardar', style: TextStyle(fontSize: 18)),
              )
            ],
          )),
    );
  }
}
