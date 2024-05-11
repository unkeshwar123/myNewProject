
import 'package:get/get.dart';
import 'package:p_assignment/apiService/api_service.dart';
import 'package:p_assignment/apiService/dio_client.dart';
import 'package:p_assignment/model/models.dart';
import 'package:p_assignment/util/connectivitycontroller.dart';


class PopularDealViewModel extends GetxController {
  final ConnectivityController _connectivityController = Get.find();
  final ApiService _apiService = ApiService(dioClient());
  var deals = <Deal>[].obs;
  var isLoading = false.obs;
  int _page = 1;
  int _perPage = 10;
  var bottomloadingisLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if(_connectivityController.isConnected.value){
      refresh();
    }
    _connectivityController.isConnected.listen((isConnected) {
      if (isConnected) {
        refresh();
      }
    });
  }

  Future<void> fetchData() async {
    bottomloadingisLoading.value = true;
    try {
      final response = await _apiService.fetchTopData(_perPage, _page, "id,created_at,created_at_in_millis,image_medium,comments_count,store{name}");
      _page++;
      response.deals.forEach((name) {
        deals.add(name);
      });
      bottomloadingisLoading.value = false;
      /*  deals.value = response.deals;*/
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> refresh() async {
    deals.clear();
    _page=1;
    isLoading.value = true;
    try {
      final response = await _apiService.fetchTopData(_perPage, _page, "id,created_at,created_at_in_millis,image_medium,comments_count,store{name}");
      _page++;
      response.deals.forEach((name) {
        deals.add(name);
      });
      isLoading.value = false;

    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
