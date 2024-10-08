import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkifyWidget extends StatelessWidget {
  const LinkifyWidget({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableLinkify(
      linkifiers: const [
        EmailLinkifier(),
        UrlLinkifier(),
        PhoneNumberLinkifier(),
      ],
      onOpen: (link) => _onOpen(link.url),
      options: const LinkifyOptions(
        defaultToHttps: true,
        humanize: false,
      ),
      text: text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      linkStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
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
