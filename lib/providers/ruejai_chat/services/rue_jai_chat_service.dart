import 'package:dio/dio.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_latest_event_record_info_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rue_jai_chat_service.g.dart';

@RestApi()
abstract class RueJaiChatService {
  factory RueJaiChatService(Dio dio, {String baseUrl}) = _RueJaiChatService;

  @GET('api/ruejai-chat/chat-rooms')
  Future<RuejaiResultListResponse<int>> getChatRooms();

  @GET('api/ruejai-chat/chat-rooms/{chatRoomId}/latest-event-record-info')
  Future<RuejaiResponse<RueJaiChatRoomLatestEventRecordInfoEntity>>
      getChatRoomLatestEventRecordInfo(
    @Path('chatRoomId') int chatRoomId,
  );

  @GET('api/ruejai-chat/chat-rooms/{chatRoomId}/events')
  Future<RuejaiResultListResponse<String>> getChatRoomEventArchiveUrls(
    @Path('chatRoomId') int chatRoomId,
    @Query('start') int startEventRecordNumber,
  );
}
