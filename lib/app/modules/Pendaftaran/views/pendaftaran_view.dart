import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranView> {
  const FormPendaftaranView({super.key});
  @override
  Widget build(BuildContext context) {
    final FormPendaftaranController controller = Get.put(FormPendaftaranController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPendaftaranView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isNotEmpty ? controller.nameError.value : null,
                  ),
                )
              ),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty ? null : controller.gender.value,
                  hint: Text('Pilih Jenis Kelamin'),
                  items: ['Laki-laki', 'Perempuan']
                    .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                  .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    errorText: controller.genderError.value.isNotEmpty ? controller.genderError.value : null,
                  ),
                )
              ),
              SizedBox(height: 20),
              Obx(()
                => ListTile(
                  title: Text(
                    controller.dateofBirth.value == null ? 
                    'Pilih tanggal lahir' : DateFormat('dd-MM-yyyy')
                    .format(controller.dateofBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateofBirth.value = selectedDate;
                      controller.validateDateOfBirth(tanggalLahir: selectedDate);
                    }
                  },
                  subtitle: controller.dateofBirthError.value.isNotEmpty
                  ? Text(
                    controller.dateofBirthError.value,
                    style: TextStyle(color: Colors.red),
                  )
                  : null,
                )
              ),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                    ? controller.phoneError.value : null,
                  ),
                )
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () { controller.submit(); }, child: Text('submir'))
            ],
          ),
        ),
      )
    );
  }
}