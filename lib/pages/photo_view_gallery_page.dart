import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryPage extends StatefulWidget {
  PhotoViewGalleryPage({
    required this.imageUrls,
    this.initialIndex = 0,
    super.key,
  }) : pageController = PageController(initialPage: initialIndex);

  final List<String> imageUrls;
  final int initialIndex;
  final PageController pageController;

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
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
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
    );
  }
}
