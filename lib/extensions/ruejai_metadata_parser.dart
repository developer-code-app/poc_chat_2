import 'package:html/dom.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';
import 'package:poc_chat_2/extensions/ruejai_parser.dart';

extension RuejaiMetaDataParser on MetadataParser {
  static RuejaiMetadata rueJaiMiniApp(Document? document) {
    return RueJaiParser(document).parse();
  }
}
