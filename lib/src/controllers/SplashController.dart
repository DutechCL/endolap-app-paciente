// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
	@override
	void onReady() async {
		try {
      checkAuth();
		} catch (e) {
			Get.offAllNamed("/login");
		}
		
		super.onReady();
	}

  void checkAuth() async {
    try {
      var token = GetStorage().read('token');

      if (token != null) {
        Get.offAllNamed('/tabs');
      }else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.offAllNamed('/login');
    }
  }
}