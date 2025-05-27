import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:ecommerce_app/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:get/get.dart';
import '../features/common/controllers/main_bottom_nav_bar_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(MainBottomNavBarController());
    Get.put(SignUpController());
  }
}