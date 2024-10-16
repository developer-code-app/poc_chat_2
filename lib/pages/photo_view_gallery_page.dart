import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:poc_chat_2/widgets/loading_with_blocking_widget.dart';

class PhotoViewGalleryPage extends StatefulWidget {
  PhotoViewGalleryPage({
    required this.imageUrls,
    this.initialIndex = 0,
    this.onImageDownloaded,
    super.key,
  }) : pageController = PageController(initialPage: initialIndex);

  final List<String> imageUrls;
  final int initialIndex;
  final PageController pageController;
  final void Function(int currentIndex)? onImageDownloaded;

  @override
  State<PhotoViewGalleryPage> createState() => _PhotoViewGalleryPageState();
}

class _PhotoViewGalleryPageState extends State<PhotoViewGalleryPage> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imageUrls.map(NetworkImage.new).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${currentIndex + 1} / ${images.length}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.download,
                color: Colors.grey.shade700,
              ),
              onPressed: () {
                widget.onImageDownloaded?.call(currentIndex);
              },
            ),
          ),
        ],
      ),
      body: LoadingWithBlockingWidget(
        child: PhotoViewGallery.builder(
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: images[index],
              heroAttributes: PhotoViewHeroAttributes(tag: index),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
            );
          },
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          pageController: widget.pageController,
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: images.length,
          loadingBuilder: (context, event) => const Center(
            child: CircularProgressIndicator(),
          ),
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
