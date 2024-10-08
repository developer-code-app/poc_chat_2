import 'package:metadata_fetch/metadata_fetch.dart';

mixin RuejaiBaseMetadataParser on BaseMetadataParser {
  String? type;
  String? targetAction;
  String? jobNumber;
  String? jobAppointment;
  String? defaultMessage;

  @override
  RuejaiMetadata parse() {
    final metadata = RuejaiMetadata();

    metadata.title = title;
    metadata.description = description;
    metadata.image = image;
    metadata.url = url;
    metadata.type = type;
    metadata.targetAction = targetAction;
    metadata.jobNumber = jobNumber;
    metadata.jobAppointment = jobAppointment;
    metadata.defaultMessage = defaultMessage;

    return metadata;
  }
}

class RuejaiMetadata extends Metadata {
  String? type;
  String? targetAction;
  String? jobNumber;
  String? jobAppointment;
  String? defaultMessage;
}
