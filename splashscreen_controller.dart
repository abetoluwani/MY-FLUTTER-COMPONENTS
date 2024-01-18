import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;

  // @override
  // Future<void> onReady() async {
  //   await Future.delayed(const Duration(seconds: 3));

  //   Get.offAllNamed(Routes.ONBOARDING);

  //   super.onReady();
  // }


  void increment() => count.value++;
}