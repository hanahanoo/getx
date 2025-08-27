import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AlquranDetailView extends GetView {
  const AlquranDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlquranDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlquranDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
