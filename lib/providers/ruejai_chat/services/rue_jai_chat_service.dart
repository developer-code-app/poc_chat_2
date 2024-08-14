import 'package:dio/dio.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rue_jai_chat_service.g.dart';

@RestApi()
abstract class RueJaiChatService {
  factory RueJaiChatService(Dio dio, {String baseUrl}) = _RueJaiChatService;

  @GET('api/ruejai-chat/chat-rooms')
  Future<RuejaiResultListResponse<int>> getChatRooms();
}
