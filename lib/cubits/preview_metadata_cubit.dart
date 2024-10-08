import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';

class PreviewMetadataCubit extends Cubit<List<PreviewMetadataCubitState>> {
  PreviewMetadataCubit() : super([]);

  void addPreviewMetadata({
    required int messageId,
    required RuejaiMetadata metadata,
  }) {
    final previewMetadata = List<PreviewMetadataCubitState>.from(state);

    previewMetadata.add(
      PreviewMetadataCubitState(
        messageId: messageId,
        metadata: metadata,
      ),
    );

    emit(previewMetadata);
  }
}

class PreviewMetadataCubitState {
  PreviewMetadataCubitState({
    required this.messageId,
    required this.metadata,
  });

  final int messageId;
  final RuejaiMetadata metadata;
}
