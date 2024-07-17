import 'package:endolap_paciente_app/src/constants.dart';
import 'package:endolap_paciente_app/src/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Image.asset('assets/images/logo-endolap.jpg',
                  width: size.width * 1),
              Text("Iniciar sesión", style: titleStyle()),
              const SizedBox(height: 30),
              Form(
                key: authController.loginFormState,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email
                    const Text("Correo"),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: formFieldStyle()
                          .copyWith(hintText: "Ingresa tu correo electrónico"),
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return 'Ingresa tu correo electrónico';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password
                    const Text("Contraseña"),
                    const SizedBox(height: 10),
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
                              controller: authController.passwordController,
                              obscureText: p0.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ingresa tu contraseña';
                                }
                                return null;
                              },
                            ),
                        true.obs),
                    const SizedBox(height: 30),

                    Obx(() => authController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox()),

                    Row(
                      children: [
                 
                        const Spacer(),
                        // Forgot password
                        TextButton(
                          child: const Text("Recuperar contraseña",
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                          onPressed: () {
                            Get.toNamed('/auth/recuperate');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Submit
                    ElevatedButton(
                      style: accentButtonStyle().copyWith(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 0)),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: const Text("Iniciar sesión"),
                      onPressed: () => authController.validateLogin(),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("¿Aun no tienes una cuenta?",
                            style: TextStyle(color: Colors.grey[600])),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: const Text("Regístrate",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
