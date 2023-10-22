import 'package:endolap_paciente_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
	const LoginScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return Scaffold(
			body: Padding(
				padding: const EdgeInsets.all(20),
				child: Column(
					children: [
						Image.asset('assets/images/logo-endolap.jpg', width: size.width * 1),
						Text("Iniciar sesión", style: titleStyle()),
						const SizedBox(height: 30),
						Form(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									// Email
									const Text("Correo"),
									const SizedBox(height: 10),
									TextFormField(
										decoration: formFieldStyle().copyWith(
											hintText: "Ingresa tu correo electrónico"
										),
									),
									const SizedBox(height: 20),
									// Password
									const Text("Contraseña"),
									const SizedBox(height: 10),
									TextFormField(
										decoration: formFieldStyle(),
									),
									const SizedBox(height: 30),

									Row(
										children: [
											// Remember me
											Checkbox(
												value: false,
												onChanged: (value) {},
											),
											const Text("Recordarme"),
											const Spacer(),
											// Forgot password
											TextButton(
												child: const Text("Recuperar contraseña", style: TextStyle(decoration: TextDecoration.underline)),
												onPressed: () {},
											),
										],
									),
									const SizedBox(height: 30),

									// Submit
									ElevatedButton(
										style: accentButtonStyle().copyWith(
											minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
											elevation: MaterialStateProperty.all<double>(0),
										),
										child: const Text("Iniciar sesión"),
										onPressed: () {
											Get.offAllNamed('/tabs');
										},
									),

									const SizedBox(height: 20),
									Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											const Text("¿No tienes una cuenta?"),
											const SizedBox(width: 10),
											TextButton(
												child: const Text("Regístrate", style: TextStyle(decoration: TextDecoration.underline)),
												onPressed: () {
													Get.toNamed('/signup');
												},
											),
										],
									)
								],
							),
						),
					],
				),
			),
		);
	}
}