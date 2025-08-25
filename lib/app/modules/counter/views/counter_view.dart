import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx/app/modules/counter/controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CounterView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Hitungan ke:${controller.hitung.toString()}",
                style: TextStyle(fontSize: controller.hitung.toDouble()),
              ),
            ),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: controller.decrement,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}