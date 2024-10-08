import 'package:html/dom.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
// ignore: implementation_imports
import 'package:metadata_fetch/src/utils/util.dart';
import 'package:poc_chat_2/extensions/ruejai_base_metadata_parser.dart';

class RueJaiParser with BaseMetadataParser, RuejaiBaseMetadataParser {
  RueJaiParser(this._document);

  final Document? _document;

  @override
  String? get title => getProperty(
        _document,
        property: 'ruejai:title',
      );

  @override
  String? get description => getProperty(
        _document,
        property: 'ruejai:description',
      );

  @override
  String? get image => getProperty(
        _document,
        property: 'ruejai:image',
      );

  @override
  String? get url => getProperty(
        _document,
        property: 'ruejai:url',
      );

  @override
  String? get type => getProperty(
        _document,
        property: 'ruejai:type',
      );

  @override
  String? get targetAction => getProperty(
        _document,
        property: 'ruejai:target_action',
      );

  @override
  String? get jobNumber => getProperty(
        _document,
        property: 'ruejai:home_care:job_number',
      );

  @override
  String? get jobAppointment => getProperty(
        _document,
        property: 'ruejai:home_care:job_appointment',
      );

  @override
  String? get defaultMessage => getProperty(
        _document,
        property: 'ruejai:default_message',
      );

  @override
  String toString() => parse().toString();
}
