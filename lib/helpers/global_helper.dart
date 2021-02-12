import 'package:intl/intl.dart';

class GlobalHelper {
  String formatDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  DateTime convertTimestampToDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    return dateTime;
  }

  String formatPatientAge(String age) {
    var index = age.indexOf(',');
    var formattedString = age.substring(0, index);
    return formattedString.toLowerCase();
  }

  String formatPatientNameField(String name) {
    var substring = name;
    int charLimit = 30;
    if (substring.length > charLimit) {
      substring = substring.substring(0, charLimit);
      substring = substring + '...';
    }
    return substring;
  }
}
