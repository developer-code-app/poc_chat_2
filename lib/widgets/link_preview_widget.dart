import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';
import 'package:poc_chat_2/widgets/linkify_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkPreviewWidget extends StatefulWidget {
  const LinkPreviewWidget({
    required this.text,
    this.metadata,
    super.key,
  });

  final String text;
  final RuejaiMetadata? metadata;

  @override
  State<LinkPreviewWidget> createState() => _LinkPreviewWidgetState();
}

class _LinkPreviewWidgetState extends State<LinkPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    final title = widget.metadata?.title;
    final description = widget.metadata?.description;
    final imageUrl = widget.metadata?.image;
    final metadata = widget.metadata;
    final url = linkify(widget.text).whereType<UrlElement>().firstOrNull?.url;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinkifyWidget(text: widget.text),
          if (metadata != null) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => url?.let(_onOpen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageUrl != null) ...[
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  if (title != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _onOpen(String url) async {
    launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
