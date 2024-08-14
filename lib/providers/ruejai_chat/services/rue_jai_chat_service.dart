import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rue_jai_chat_service.g.dart';

@RestApi()
abstract class RueJaiChatService {
  factory RueJaiChatService(Dio dio, {String baseUrl}) = _RueJaiChatService;

  @GET('api/main_feed')
  Future<List<int>> getChatRooms();
}
