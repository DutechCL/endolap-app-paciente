import 'package:endolap_paciente_app/src/models/notification_model.dart';
import 'package:get/get.dart';
import '../services/alert_service.dart';
import '../services/api_service.dart';

class NotificationController extends GetxController {
  final ApiService _apiService = ApiService();

  Rx<List<NotificationModel>> notifications = Rx<List<NotificationModel>>([]);
  var isLoading = false.obs;
  
	@override
	void onReady(){
		super.onReady();

    fetchNotificationList();
	}

  fetchNotificationList() async {
    isLoading.value = true;

    final response = await _apiService.getWithToken('/notifications/show');

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        notifications.value = response.data['data'].map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
      }
    }

    isLoading.value = false;
  }
}