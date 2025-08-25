import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 0.obs; 
  void increment() {
    if(hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh lebih dari 10", 
        backgroundColor: Colors.red, 
        icon: Icon(Icons.warning, color: Colors.white,), 
        colorText: Colors.white);
    }
  }
  void decrement() {
    if(hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh kurang dari 0",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white,), 
        colorText: Colors.white);
    }
  }
}