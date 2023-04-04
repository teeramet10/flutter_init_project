import 'package:easy_localization/easy_localization.dart';

class DateFormatUtils {
  static const String serverFormat = "yyyy-MM-ddTHH:mm:ss";

  static const String format1 = "MMMM yyyy";

  static const String format2 = "dd MMM yyyy HH:mm";

  static const String format3 = "dd MMM yyyy";

  static const String format4 = "yyyy-MM-ddTHH:mm:ss.SSS'Z'";

  static const String format5 = "yyyy";

  static const String format6 = "MMM";

  static String dateToString(String format, DateTime date) {
    DateFormat dateFormat = DateFormat(format, 'en');
    return dateFormat.format(date);
  }

  static String dateStringToString(String format, String date) {
    DateFormat inputFormat = DateFormat(serverFormat);
    DateTime inputDate = inputFormat.parse(date);

    DateFormat outputFormat = DateFormat(format, 'en');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
