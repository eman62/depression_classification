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
  static parseDateTimeReturnDescriptionString(String dateTimeString, {Locale locale = const Locale('en')}) {
    var dateTime = DateTime.parse(dateTimeString).toLocal();

    bool dateEqualToday = DateTime.now().year == dateTime.year &&
        DateTime.now().month == dateTime.month &&
        DateTime.now().day == dateTime.day;

    bool dateDifferFromTodayByLessThanFiveDays = DateTime.now().year == dateTime.year &&
        DateTime.now().month == dateTime.month &&
        DateTime.now().day - dateTime.day <= 5;

    if (dateEqualToday) {
      return 'Today';
    }

    else if (dateDifferFromTodayByLessThanFiveDays) {
      int diff = DateTime.now().day - dateTime.day;
      if (diff == 1) return 'Yesterday';
      if (diff == 2) return '2 days ago';
      return '${DateTime.now().day - dateTime.day} days ago';
    }

    else {
      String dateString = DateFormat('d/M/y').format(dateTime);
      String timeString = DateFormat('hh:mm a').format(dateTime);
      return '$dateString  $timeString';
    }
  }
}
