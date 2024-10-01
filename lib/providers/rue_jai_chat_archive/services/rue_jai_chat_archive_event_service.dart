import 'package:dio/dio.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rue_jai_chat_archive_event_service.g.dart';

@RestApi()
abstract class RueJaiChatArchiveEventService {
  factory RueJaiChatArchiveEventService(Dio dio, {String baseUrl}) =
      _RueJaiChatArchiveEventService;

  @GET('{url}')
  Future<RuejaiListResponse<RueJaiChatRecordedEventEntity>>
      getChatRoomEventsFromUrl(
    @Path('url') String url,
  );
}
