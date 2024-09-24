import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_and_videos_subpage_event.dart';
part 'photos_and_videos_subpage_state.dart';

typedef _Event = PhotosAndVideosSubpageEvent;
typedef _State = PhotosAndVideosSubpageState;

class PhotosAndVideosSubpageBloc extends Bloc<_Event, _State> {
  PhotosAndVideosSubpageBloc() : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoaded);
  }

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
