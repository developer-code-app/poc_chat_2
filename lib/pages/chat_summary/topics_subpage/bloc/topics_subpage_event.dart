part of 'topics_subpage_bloc.dart';

sealed class TopicsSubpageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {}
