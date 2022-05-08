import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

abstract class DateHelpers {
  /// Parse Date/Time String - Return Date/Time
  static parseDateTimeReturnDateTime(String dateTimeString) {
    var dateTime = DateTime.parse(dateTimeString).toLocal();
    return '$dateTime';
  }

  /// Parse Date/Time String - Return Custom Date/Time String
  static parseDateTimeReturnDateTimeString(String dateTimeString) {
    var dateTime = DateTime.parse(dateTimeString).toLocal();
    String dateString = DateFormat('d/M/y').format(dateTime);
    String timeString = DateFormat('hh:mm a').format(dateTime);
    return '$dateString  $timeString';
  }

  /// Parse Date/Time - Return Description (today, yesterday .. etc)
  static parseDateTimeReturnDescriptionString(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();

    bool dateEqualToday = DateTime.now().difference(dateTime).inDays == 0;
    bool dateDifferFromTodayByLessThanFiveDays = DateTime.now().difference(dateTime).inDays <= 5;
    // print(dateTime);
    // print(DateTime.now());
    // print('Difference: ${DateTime.now().difference(dateTime).inDays}');

    if (dateEqualToday) {
      return 'Today';
    } else if (dateDifferFromTodayByLessThanFiveDays) {
      int diff = DateTime.now().difference(dateTime).inDays;
      // print ('/// diff');
      // print (diff);
      if (diff == 1) return'Yesterday';
      return'$diff days ago';
    } else {
      String dateString = DateFormat('d/M/y').format(dateTime);
      String timeString = DateFormat('hh:mm a').format(dateTime);
      return '$dateString  $timeString';
    }
  }
}
