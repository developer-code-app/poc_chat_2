import 'package:timezone/data/latest.dart' as tz_latest;
import 'package:timezone/timezone.dart' as tz;

Future<void> setupTimeZone() async {
  tz_latest.initializeTimeZones();
  final location = tz.getLocation('Asia/Bangkok');
  tz.setLocalLocation(location);
}
