import 'package:poc_chat_2/models/rue_jai_user.dart';

abstract class Event {
  Event({
    required this.id,
    required this.owner,
    required this.createdAt,
  });

  final String id;
  final Owner owner;
  final DateTime createdAt;
}

class Owner {
  Owner({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
