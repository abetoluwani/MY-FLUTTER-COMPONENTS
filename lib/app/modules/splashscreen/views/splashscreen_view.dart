import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
