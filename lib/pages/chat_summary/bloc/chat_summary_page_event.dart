part of 'chat_summary_page_bloc.dart';

sealed class ChatSummaryPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {}
