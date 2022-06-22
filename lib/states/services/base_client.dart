import 'package:dio/dio.dart';
import 'package:nearexpiryshopdriver/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({required String api}) async {
    print(ConstantStrings.kBaseUrl + api);
    try {
      var response = await Dio().get(ConstantStrings.kBaseUrl + api);
      print('Base Client: ${response.statusCode}');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
