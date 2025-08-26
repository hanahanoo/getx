import 'package:get/get.dart';
import 'package:getx/app/modules/Pendaftaran/views/results_screen_view.dart';

class FormPendaftaranController extends GetxController {
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateofBirth = Rxn<DateTime>();
  RxString phone = ''.obs;
  //TODO: Implement FormPendaftaranController

  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateofBirthError = ''.obs;
  RxString phoneError = ''.obs;


// fungsi validasi name
void validateName({required String name}) {
  if(name.length < 3) {
    nameError.value = 'Nama minimal 3 Karakter';
  } else {
    nameError.value = '';
  }
}

void validateGender({required String? jenisKelamin}) {
  if(jenisKelamin == null || jenisKelamin.isEmpty) {
    genderError.value = 'Pilih jenis kelamin';
  } else {
    genderError.value = '';
  }
}

void validateDateOfBirth({required DateTime? tanggalLahir}) {
  if(tanggalLahir == null) {
    dateofBirthError.value = 'Pilih tanggal lahir';
  } else {
    final now = DateTime.now();
    final age = now.year - tanggalLahir.year;
    if (age < 2) {
      dateofBirthError.value = 'Umur minimal 2 tahun';
    } else {
      dateofBirthError.value = '';
    }
  }
}

void validatePhone({required String phone}) {
  if(!GetUtils.isPhoneNumber(phone)) {
    phoneError.value = 'Nomor telepon tidak valid';
  } else {
    phoneError.value = '';
  }
}


void submit(){
  validateName(name: name.value);
  validateGender(jenisKelamin: gender.value);
  validateDateOfBirth(tanggalLahir: dateofBirth.value);
  validatePhone(phone: phone.value);
  if(nameError.value.isEmpty && genderError.value.isEmpty && dateofBirthError.value.isEmpty) {
    Get.to(
      () => ResultsScreenView(
        name: name.value,
        gender: gender.value,
        dateofBirth: dateofBirth.value!,
        phone: phone.value,
      )
    );

  } else {
    Get.snackbar("Error", "Periksa Input Anda");
  }
}

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}