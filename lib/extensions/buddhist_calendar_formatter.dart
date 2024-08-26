import 'package:intl/intl.dart';

extension BuddhistCalendarFormatter on DateFormat {
  String formatBuddhistCalendar(DateTime dateTime) {
    if (pattern?.contains('y') ?? false) {
      final buddhistDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        dateTime.hour,
        dateTime.minute,
        dateTime.second,
        dateTime.millisecond,
        dateTime.microsecond,
      );

      if (locale.contains('th') || locale.contains('TH')) {
        final normalYear = buddhistDateTime.year;
        final String dateTimeString = format(buddhistDateTime)
            .replaceAll('ค.ศ.', 'พ.ศ.')
            .replaceAll(normalYear.toString(), (normalYear + 543).toString());

        return dateTimeString;
      } else {
        final result = format(buddhistDateTime);
        return result;
      }
    }

    return format(dateTime);
  }
}
