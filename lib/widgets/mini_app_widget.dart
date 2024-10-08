import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';
import 'package:poc_chat_2/models/mini_app_type.dart';

class MiniAppWidget extends StatelessWidget {
  const MiniAppWidget({required this.metadata, super.key});

  final RuejaiMetadata metadata;

  @override
  Widget build(BuildContext context) {
    final type =
        metadata.type?.let(MiniAppType.fromString) ?? MiniAppType.unsupported;

    switch (type) {
      case MiniAppType.homeCare:
        return _buildHomeCare(context, metadata: metadata);
      case MiniAppType.homeCareJobCreateDefect:
        return _buildHomeCareJobCreateDefect(context, metadata: metadata);
      default:
        return _buildUnsupportedMiniApp(context, metadata: metadata);
    }
  }

  Widget _buildHomeCareJobCreateDefect(
    BuildContext context, {
    required RuejaiMetadata metadata,
  }) {
    final title = metadata.title;
    final imageUrl = metadata.image;

    return _buildScaffold(
      context,
      type: MiniAppType.homeCareJobCreateDefect,
      header: title?.let(
        (title) => _buildHeader(
          context,
          title: title,
          trailing: const Icon(Icons.note_alt_outlined),
        ),
      ),
      child: imageUrl?.let(
        (imageUrl) => Center(child: Image.network(imageUrl)),
      ),
    );
  }

  Widget _buildHomeCare(
    BuildContext context, {
    required RuejaiMetadata metadata,
  }) {
    final title = metadata.title;
    final jobNumber = metadata.jobNumber;
    final jobAppointment = metadata.jobAppointment;

    return _buildScaffold(
      context,
      type: MiniAppType.homeCare,
      header: title?.let(
        (title) => _buildHeader(
          context,
          title: title,
          trailing: const Icon(Icons.note_alt_outlined),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (jobNumber != null) ...[
            const Text(
              'เลขใบงาน',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              jobNumber,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (jobAppointment != null) ...[
            const Text(
              'วันนัดหมาย',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              jobAppointment,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildUnsupportedMiniApp(
    BuildContext context, {
    required RuejaiMetadata metadata,
  }) {
    final title = metadata.title;
    final image = metadata.image;
    final defaultMessage = metadata.defaultMessage;

    return _buildScaffold(
      context,
      type: MiniAppType.unsupported,
      header: title?.let(
        (title) => _buildHeader(context, title: title),
      ),
      child: Column(
        children: [
          if (image != null)
            Center(
              child: Image.network(image),
            ),
          const SizedBox(height: 8),
          Text(
            defaultMessage.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    Widget? header,
    Widget? child,
    required MiniAppType type,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) ...[
            header,
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
          ],
          if (child != null) child,
          if (type != MiniAppType.unsupported) ...[
            const SizedBox(height: 16),
            _buildPrimaryButton(context, title: type.description)
          ],
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required String title,
    String? subtitle,
    Widget? trailing,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 16),
              trailing,
            ]
          ],
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(
    BuildContext context, {
    required String title,
  }) {
    return Container(
      width: 400,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
