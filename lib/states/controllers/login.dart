import 'package:get/get.dart';
import 'package:nearexpiryshopdriver/states/models/driver_details/driver_details.dart';
import 'package:nearexpiryshopdriver/states/services/login.dart';

class LoginController extends GetxController {
  RxBool isLoading = true.obs;

  DriverDetailsModel? driverDetails;

  void loginFn({
    required String userName,
    required String password,
  }) async {
    isLoading(true);
    try {
      driverDetails = await LoginService.loginFn(
        userName: userName,
        password: password,
      );
      print(driverDetails!.name);
    } finally {
      isLoading(false);
    }
  }
}
