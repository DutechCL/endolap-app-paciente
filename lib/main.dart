import 'package:endolap_paciente_app/src/utils/router.dart';
import 'package:endolap_paciente_app/src/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
			title: 'Endolap Paciente',
			getPages: Routes.route,
			initialRoute: '/splash',
			locale: const Locale('es', 'ES'),
			translations: LanguageTranslations(),
			fallbackLocale: const Locale('es'),
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
        useMaterial3: false,
        colorSchemeSeed: const Color(0xff00d6d6),
				// primaryColor: const Color(0xff00d6d6),
				visualDensity: VisualDensity.adaptivePlatformDensity,
				scaffoldBackgroundColor: Colors.white,
				appBarTheme: const AppBarTheme(
					color: Colors.white,
					centerTitle: true,
					titleTextStyle: TextStyle(
						color: Color(0xff007eb9),
						fontSize: 20,
						fontWeight: FontWeight.w600,
					),
					foregroundColor: Color(0xff777777),
					elevation: 0,
				),
			),
		);
	}
}