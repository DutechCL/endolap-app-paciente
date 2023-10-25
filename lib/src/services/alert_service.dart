import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertService {
  showAlert({String title = 'Alerta', String message = 'Ocurrió un error', IconData icon = Icons.info_outline_rounded, Color color = Colors.white, position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      colorText: Colors.white,
      icon: Icon(icon, color: color),
      snackPosition: position,
    );
  }

  showSuccessAlert({String title = 'Éxito', String message = 'Operación realizada con éxito'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  showWarningAlert({String title = 'Advertencia', String message = 'Ocurrió un error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      colorText: Colors.white,
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  showErrorAlert({String title = 'Error', String message = 'Ocurrió un error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      colorText: Colors.white,
      icon: const Icon(Icons.error_outline_rounded, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}