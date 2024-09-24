import 'package:flutter_bloc/flutter_bloc.dart';

part 'topics_subpage_event.dart';
part 'topics_subpage_state.dart';

typedef _Event = TopicsSubpageEvent;
typedef _State = TopicsSubpageState;

class TopicsSubpageBloc extends Bloc<_Event, _State> {
  TopicsSubpageBloc() : super(InitialState()) {
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
