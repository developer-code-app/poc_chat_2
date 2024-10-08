import 'dart:async';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';
import 'package:poc_chat_2/extensions/ruejai_metadata_parser.dart';

class RuejaiMetadataFetch {
  static Future<RuejaiMetadata?> extract(String text) async {
    final response = await http.get(Uri.parse(text));
    final document = MetadataFetch.responseToDocument(response);

    if (document == null) return null;

    return _parse(document);
  }

  static RuejaiMetadata _parse(Document document) {
    final miniApp = RuejaiMetaDataParser.rueJaiMiniApp(document);
    final openGraph = MetadataParser.openGraph(document);
    final twitterCard = MetadataParser.twitterCard(document);
    final jsonLdSchema = MetadataParser.jsonLdSchema(document);
    final htmlMeta = MetadataParser.htmlMeta(document);

    final metadata = RuejaiMetadata();

    metadata.title = miniApp.title ??
        openGraph.title ??
        twitterCard.title ??
        jsonLdSchema.title ??
        htmlMeta.title;
    metadata.description = miniApp.description ??
        openGraph.description ??
        twitterCard.description ??
        jsonLdSchema.description ??
        htmlMeta.description;
    metadata.image = miniApp.image ??
        openGraph.image ??
        twitterCard.image ??
        jsonLdSchema.image ??
        htmlMeta.image;
    metadata.url = miniApp.url ??
        openGraph.url ??
        twitterCard.url ??
        jsonLdSchema.url ??
        htmlMeta.url;
    metadata.type = miniApp.type;
    metadata.targetAction = miniApp.targetAction;
    metadata.jobNumber = miniApp.jobNumber;
    metadata.jobAppointment = miniApp.jobAppointment;
    metadata.defaultMessage = miniApp.defaultMessage;

    return metadata;
  }
}
