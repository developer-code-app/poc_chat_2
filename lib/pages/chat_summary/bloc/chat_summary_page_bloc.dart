import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/pages/chat_summary/photos_and_videos_subpage/bloc/photos_and_videos_subpage_bloc.dart'
    as photos_and_videos;
import 'package:poc_chat_2/pages/chat_summary/topics_subpage/bloc/topics_subpage_bloc.dart'
    as topics;

part 'chat_summary_page_event.dart';
part 'chat_summary_page_state.dart';

typedef _Event = ChatSummaryPageEvent;
typedef _State = ChatSummaryPageState;

class ChatSummaryPageBloc extends Bloc<_Event, _State> {
  ChatSummaryPageBloc({
    required this.topicsSubpageBloc,
    required this.photosAndVideosSubpageBloc,
  }) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoaded);
  }

  final topics.TopicsSubpageBloc topicsSubpageBloc;
  final photos_and_videos.PhotosAndVideosSubpageBloc photosAndVideosSubpageBloc;

  Future<void> _onStartedEvent(
    StartedEvent event,
    Emitter<_State> emit,
  ) async {
    add(DataLoadedEvent());
  }

  Future<void> _onDataLoaded(
    DataLoadedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadSuccessState());
  }
}
