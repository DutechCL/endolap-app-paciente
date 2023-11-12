import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  logout() async {
    // await _authService.logout();
    GetStorage().erase();
    Get.offAllNamed('/login');
  }
}