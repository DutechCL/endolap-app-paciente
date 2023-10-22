import 'package:get/get.dart';

class LanguageTranslations extends Translations {
	@override
	// TODO: implement keys
	Map<String, Map<String, String>> get keys => {
		'en_US': {
			'hello': 'Hello World',
		},
		'es': {
			'hello': 'Hola Mundo',
		},


	};
}