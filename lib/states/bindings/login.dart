import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/controllers/login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
  }
}
