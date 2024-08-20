import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/models/message.dart';

class ReplyMessageCubit extends Cubit<Message?> {
  ReplyMessageCubit() : super(null);

  void reply(Message message) => emit(message);

  void clear() => emit(null);
}
