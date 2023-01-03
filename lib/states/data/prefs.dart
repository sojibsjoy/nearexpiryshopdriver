import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const loggedInFlag = 'loginFlag';
  static const driverID = 'driverID';
  static const driverName = 'driverName';
  static const driverAddress = 'driverAddress';
  static const driverImg = 'driverImg';

  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  static void setLoggedInFlag(bool value) {
    prefs.write(loggedInFlag, value);
  }

  static int getDriverID() {
    return prefs.read(driverID) ?? 1;
  }

  static void setDriverID(int value) {
    prefs.write(driverID, value);
  }

  static String getDriverName() {
    return prefs.read(driverName) ?? '';
  }

  static void setDriverName(String value) {
    prefs.write(driverName, value);
  }

  static String getDriverAddress() {
    return prefs.read(driverAddress) ?? '';
  }

  static void setDriverAddress(String value) {
    prefs.write(driverAddress, value);
  }

  static String getDriverImg() {
    return prefs.read(driverImg) ?? '';
  }

  static void setDriverImg(String value) {
    prefs.write(driverImg, value);
  }

  static void clearAll() {
    prefs.erase();
  }
}
