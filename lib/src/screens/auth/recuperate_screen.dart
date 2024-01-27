import 'package:endolap_paciente_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:endolap_paciente_app/src/controllers/RecuperateController.dart';

class RecuperateScreen extends StatelessWidget {
  const RecuperateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecuperateController controller = RecuperateController();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: _buildLoginForm(context, controller),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(
      BuildContext context, RecuperateController controller) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/images/logo-endolap.jpg',
                  width: size.width * 1),
              const SizedBox(height: 30),
              Text("Recuperar contraseña", style: titleStyle()),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ingresa tu email"),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: formFieldStyle().copyWith(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        TextButton(
                          child: const Text(
                              "¿Ya tienes una cuenta? Inicia sesión",
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                          onPressed: () {
                            Get.offAllNamed('/auth/login');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: primaryButtonStyle().copyWith(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 0)),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: const Text("Enviar código de recuperación"),
                      onPressed: () {
                        controller.recuperate();
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
