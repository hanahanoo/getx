import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/app/routes/app_pages.dart';
import 'package:getx/app/services/auth_service.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final AuthService api = AuthService();
  final box = GetStorage();

  var isLoading = false.obs;

  Future<void> login(String email, String passsword) async {
    isLoading.value = true;
    final res = await api.login(email, passsword);
    isLoading.value = false;

    if (res.statusCode ==  200) {
      final token = res.body['access_token'];
      box.write('token', token);
      Get.offAllNamed(Routes.HOME);
      Get.snackbar('Success', 'LOgin Successful');
    } else {
      Get.snackbar('Error', res.body['message'] ?? 'Login gagal');
    }
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    final res = await api.register(name, email, password);
    isLoading.value = false;

    if (res.statusCode == 201) {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('Success', 'Register berhasil');
    } else{
      Get.snackbar('Error', res.body.toString());
    }
  }
  
  Future<void> logout() async {
    final token = box.read('token');
    if (token != null) {
      await api.logout(token);
    }
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }
}
