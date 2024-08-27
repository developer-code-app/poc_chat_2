import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poc_chat_2/extensions/buddhist_calendar_formatter.dart';
import 'package:poc_chat_2/extensions/extended_tz_date_time.dart';
import 'package:timezone/timezone.dart';

extension ExtendedDateTime on DateTime {
  String toRelativeTime(BuildContext context) {
    final differenceFromNow = ExtendedTZDateTime.now().difference(toTZLocal());
    final defaultFormat = DateFormat(
      'd MMMM yyyy',
    ).formatBuddhistCalendar(toTZLocal());

    if (differenceFromNow < const Duration()) {
      return defaultFormat;
    } else if (differenceFromNow < const Duration(seconds: 10)) {
      return 'Just now';
    } else if (differenceFromNow < const Duration(seconds: 60)) {
      return '${differenceFromNow.inSeconds.toString()} seconds ago';
    } else if (differenceFromNow < const Duration(minutes: 60)) {
      return '${differenceFromNow.inMinutes.toString()} minutes ago';
    } else if (differenceFromNow < const Duration(hours: 24)) {
      return '${differenceFromNow.inHours.toString()} hours ago';
    } else {
      return defaultFormat;
    }
  }

  String stringFormat(String pattern, {String? locale}) {
    return DateFormat(pattern, locale)
        .formatBuddhistCalendar(toTZLocal())
        .toString();
  }

  DateTime toStartOfDay() {
    return DateTime.utc(year, month, day);
  }

  DateTime toEndOfDay() {
    return DateTime.utc(year, month, day)
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));
  }

  TZDateTime toTZLocal() {
    return TZDateTime.from(this, local);
  }

  DateTime updateTime({TimeOfDay? time}) {
    return DateTime(
      year,
      month,
      day,
      time?.hour ?? hour,
      time?.minute ?? minute,
    );
  }

  bool isOverdue(TimeOfDay time) {
    final dateNow = ExtendedTZDateTime.now();
    final currentDate = DateTime.utc(
      dateNow.year,
      dateNow.month,
      dateNow.day,
      dateNow.hour,
      dateNow.minute,
    );

    return toStartOfDay()
        .add(Duration(hours: time.hour, minutes: time.minute))
        .isBefore(currentDate);
  }

  String toShortMonthFormat() => stringFormat('d MMM yyyy');
  String toRegularFormat() => stringFormat('d MMMM yyyy');
  String toDaysOfWeekWithRegularFormat() => stringFormat('EEEE d MMMM yyyy');
  String toMonthOnlyFormat() => stringFormat('MMMM');
  String toDayOnlyFormat() => stringFormat('d');
  String toHourAndMinute() => stringFormat('Hm');
  String toQrCodeExpireDateFormat() => stringFormat('d MMM yyyy HH:mm');
  String toShortFormat() => stringFormat('dd/MM/yy HH:mm');
  String toShortDateFormat() => stringFormat('dd/MM/yy');
  String toLongDateFormat() => stringFormat('dd/MM/yyyy');
  String toYearMonthDayFormat() => stringFormat('yyyy-MM-dd');
  String toTimeFormat() => stringFormat('HH:mm');
  String toFullMonthYearFormat() => stringFormat('MMMM yyyy');
}
