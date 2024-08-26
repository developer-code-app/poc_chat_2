import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/pages/chat_summary/bloc/chat_summary_page_bloc.dart';
import 'package:poc_chat_2/pages/chat_summary/photos_and_videos_subpage/photos_and_videos_subpage.dart';
import 'package:poc_chat_2/pages/chat_summary/topics_subpage/topics_subpage.dart';

class ChatSummaryPage extends StatelessWidget {
  const ChatSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatSummaryPageBloc>();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Summary"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Topics'),
              Tab(text: 'Photos & Videos'),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: <Widget>[
                MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: bloc.topicsSubpageBloc),
                  ],
                  child: const TopicsSubpage(),
                ),
                MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: bloc.photosAndVideosSubpageBloc),
                  ],
                  child: const PhotosAndVideosSubpage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
