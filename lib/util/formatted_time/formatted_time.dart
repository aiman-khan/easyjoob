// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class DateFormatUtil {
  static String formatDateAndTime(String date) {
    if (date.isEmpty) {
      return "";
    }
    String formattedDate =
        DateFormat("dd MMMM, h:mm a").format(DateTime.parse(date));
    return formattedDate;
  }

  static String formatDate(String date) {
    if (date.isEmpty) {
      return "";
    }
    String formattedDate =
        DateFormat("dd MMMM, yyyy").format(DateTime.parse(date));
    return formattedDate;
  }
}
