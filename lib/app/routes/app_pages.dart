import 'package:get/get.dart';

import '../modules/Pendaftaran/bindings/pendaftaran_binding.dart';
import '../modules/Pendaftaran/views/pendaftaran_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => const CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.PENDAFTARAN,
      page: () => const FormPendaftaranView(),
      binding: PendaftaranBinding(),
    ),
  ];
}
