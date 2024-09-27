import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/models/messages/message.dart';

class ReplyMessageCubit extends Cubit<MemberMessage?> {
  ReplyMessageCubit() : super(null);

  void reply(MemberMessage message) => emit(message);

  void clear() => emit(null);
}
