import 'package:get/get.dart';
import 'package:getx/app/modules/alquran/controllers/alquran_controller.dart';

class BacaquranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BacaquranController>(
      () => BacaquranController(),
    );
  }
}