import 'package:nearexpiryshopdriver/constants/strings.dart';
import 'package:nearexpiryshopdriver/states/models/driver_details/driver_details.dart';
import 'package:nearexpiryshopdriver/states/services/base_client.dart';

class LoginService {
  static Future<DriverDetailsModel> loginFn({
    required String userName,
    required String password,
  }) async {
    var response =
        await BaseClient.postData(api: ConstantStrings.kDriverLogin, body: {
      "userName": userName,
      "passWord": password,
    });
    DriverDetailsModel obj = DriverDetailsModel.fromJson(response);
    return obj;
  }
}
