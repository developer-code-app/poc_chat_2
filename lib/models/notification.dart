import 'package:poc_chat_2/models/events/event.dart';

abstract class Notification {
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.events,
  });

  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final List<Event> events;
}
