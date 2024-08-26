import 'package:timezone/timezone.dart';

extension ExtendedTZDateTime on TZDateTime {
  static TZDateTime now() {
    return TZDateTime.now(local);
  }

  static TZDateTime create(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) {
    return TZDateTime(
      local,
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  static TZDateTime fromMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
    return TZDateTime.fromMillisecondsSinceEpoch(
      local,
      millisecondsSinceEpoch,
    );
  }

  static TZDateTime fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch) {
    return TZDateTime.fromMicrosecondsSinceEpoch(
      local,
      microsecondsSinceEpoch,
    );
  }

  TZDateTime addYear(int value) {
    return TZDateTime(
      local,
      year + value,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  TZDateTime subtractYear(int value) {
    return TZDateTime(
      local,
      year - value,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  TZDateTime addMonth(int value) {
    return TZDateTime(
      local,
      year,
      month + value,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  TZDateTime subtractMonth(int value) {
    return TZDateTime(
      local,
      year,
      month - value,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  TZDateTime toStartOfDay() {
    return TZDateTime(local, year, month, day);
  }

  TZDateTime toEndOfDay() {
    return TZDateTime(local, year, month, day)
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));
  }

  TZDateTime toStartOfMonth() {
    return TZDateTime(local, year, month);
  }

  TZDateTime toEndOfMonth() {
    return TZDateTime(local, year, month)
        .addMonth(1)
        .subtract(const Duration(microseconds: 1));
  }

  TZDateTime toStartOfYear() {
    return TZDateTime(local, year);
  }

  TZDateTime toEndOfYear() {
    return TZDateTime(local, year)
        .addYear(1)
        .subtract(const Duration(microseconds: 1));
  }
}
