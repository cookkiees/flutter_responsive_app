import 'package:get/get.dart';

class ApiService extends GetConnect {}

class ApiServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
  }
}
