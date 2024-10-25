import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    
  }
}
