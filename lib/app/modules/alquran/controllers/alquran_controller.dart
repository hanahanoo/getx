import 'package:get/get.dart';
import 'package:getx/app/data/models/alquran.dart';
import 'package:getx/app/services/alquran_service.dart';

class BacaquranController extends GetxController {
  final BacaquranService _bacaquranService = Get.put<BacaquranService>(BacaquranService());
  //TODO: Implement BacaquranController
  RxList bacaqurans = <BacaModel>[].obs; 
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchBaca();
  }
  void fetchBaca() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _bacaquranService.fetchBaca();

      if (response.statusCode == 200) {
        var data = response.body!
            .map((json) => BacaModel.fromJson(json))
            .toList();
        bacaqurans.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

}