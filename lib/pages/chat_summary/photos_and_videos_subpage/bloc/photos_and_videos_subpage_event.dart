part of 'photos_and_videos_subpage_bloc.dart';

sealed class PhotosAndVideosSubpageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {}
