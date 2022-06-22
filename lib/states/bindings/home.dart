import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
