import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const loggedInFlag = 'login_flag';
  static const driverID = 'driverID';

  static getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  static void setLoggedInFlag(bool value) {
    prefs.write(loggedInFlag, value);
  }

  static getDriverID() {
    return prefs.read(driverID) ?? 1;
  }

  static void setDriverID(int value) {
    prefs.write(driverID, value);
  }

  static void clearAll() {
    prefs.erase();
  }
}
