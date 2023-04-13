import 'package:flutter_resposive_app/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../modules/main/controller/main_controller.dart';
import 'api_service.dart';

class ApiServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.put(MainController());
    Get.put(HomeController());
  }
}
