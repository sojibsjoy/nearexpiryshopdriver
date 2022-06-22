import 'package:intl/intl.dart';

class DateFormatter {
  static String getFormatedDate(DateTime orderDate) {
    final DateFormat formatter = DateFormat('dd MMMM, yyyy');
    final String formatted = formatter.format(orderDate);
    print(formatted);
    return formatted;
  }

  static String getFormatedDateForAPI(DateTime orderDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(orderDate);
    print(formatted);
    return formatted;
  }
}
