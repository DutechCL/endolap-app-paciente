import 'package:get/get.dart';

import '../models/procedure_list2_model.dart';
import '../services/alert_service.dart';
import '../services/api_service.dart';

class ProcedureListController extends GetxController {
  final ApiService _apiService = ApiService();
  
  final Set<int> expandedItems = Set<int>().obs;

  Rx<List<ProcedureListModel>> procedureList = Rx<List<ProcedureListModel>>([]);
  var procedureDetail = ProcedureListModel().obs;
  var isLoadingTeam = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> search = "".obs;
  
	@override
	void onReady(){
		super.onReady();

    search.listen((value) {
      fetchProcedureList();
    });

    fetchProcedureList();
	}

  fetchProcedureList() async {
    isLoading.value = true;

    final response = await _apiService.getWithToken('/scheduleProcedure/index');

    if (response.statusCode == 200) {
      procedureList.value = response.data['data'].map<ProcedureListModel>((json) => ProcedureListModel.fromJson(json)).toList();
    } else {
      AlertService().showErrorAlert(message: response.data['message']);
    }

    isLoading.value = false;
  }

  fetchProcedureDetail(int id) async {
    isLoadingTeam.value = true;

    final response = await _apiService.getWithToken('/scheduleProcedure/show/$id');

    if (response.statusCode == 200) {
      procedureDetail.value = ProcedureListModel.fromJson(response.data['data']);
    } else {
      AlertService().showErrorAlert(message: response.data['message']);
    }

    isLoadingTeam.value = false;
  }
  
}