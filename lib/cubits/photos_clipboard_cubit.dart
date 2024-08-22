import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosClipboardCubit extends Cubit<List<Uint8List>> {
  PhotosClipboardCubit() : super([]);

  void addPhotos(List<Uint8List> photos) => emit(photos);

  void remove(Uint8List photo) {
    final photos = List.of(state);

    photos.remove(photo);
    emit(photos);
  }

  void clear() => emit([]);
}
