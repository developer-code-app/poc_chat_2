import 'package:dio/dio.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_profile_entity.dart';

import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_state_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/requests/ruejai_chat_create_chat_room_request.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rue_jai_chat_service.g.dart';

@RestApi()
abstract class RueJaiChatService {
  factory RueJaiChatService(Dio dio, {String baseUrl}) = _RueJaiChatService;

  @GET('api/ruejai-chat/chat-rooms')
  Future<RuejaiListResponse<RueJaiChatRoomStateEntity>>
      getServerChatRoomStates();

  @GET('api/ruejai-chat/chat-room/{chatRoomId}/profile')
  Future<RuejaiResponse<RueJaiChatRoomProfileEntity>> getServerChatRoomProfile(
    @Path('chatRoomId') String chatRoomId,
  );

  @GET(
    'api/ruejai-chat/chat-rooms/{chatRoomId}/latest-room-and-message-event-record-number',
  )
  Future<RuejaiIntResponse> getChatRoomLatestRoomAndMessageEventRecordNumber(
    @Path('chatRoomId') String chatRoomId,
  );

  @GET('api/ruejai-chat/chat-rooms/{chatRoomId}/events')
  Future<RuejaiResultListResponse<String>> getChatRoomEventArchiveUrls(
    @Path('chatRoomId') String chatRoomId,
    @Query('start') int startEventRecordNumber,
  );

  @POST('api/ruejai-chat/chat-rooms')
  Future<RuejaiResponse<RueJaiChatRoomStateEntity>> createChatRoom(
    @Body() RuejaiChatCreateChatRoomRequest request,
  );
}
