// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_confirmed_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarConfirmedMessageEntityCollection on Isar {
  IsarCollection<IsarConfirmedMessageEntity> get isarConfirmedMessageEntitys =>
      this.collection();
}

const IsarConfirmedMessageEntitySchema = CollectionSchema(
  name: r'ConfirmedMessage',
  id: -6365796418597557064,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.byte,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'createdByEventId': PropertySchema(
      id: 2,
      name: r'createdByEventId',
      type: IsarType.string,
    ),
    r'createdByRecordNumber': PropertySchema(
      id: 3,
      name: r'createdByRecordNumber',
      type: IsarType.long,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'lastUpdatedByRecordNumber': PropertySchema(
      id: 5,
      name: r'lastUpdatedByRecordNumber',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.string,
      enumMap: _IsarConfirmedMessageEntitytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarConfirmedMessageEntityEstimateSize,
  serialize: _isarConfirmedMessageEntitySerialize,
  deserialize: _isarConfirmedMessageEntityDeserialize,
  deserializeProp: _isarConfirmedMessageEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'owner': LinkSchema(
      id: -1644511625167208652,
      name: r'owner',
      target: r'ChatRoomMember',
      single: true,
    ),
    r'room': LinkSchema(
      id: -6088272072379497743,
      name: r'room',
      target: r'ChatRoom',
      single: true,
      linkName: r'confirmedMessages',
    )
  },
  embeddedSchemas: {},
  getId: _isarConfirmedMessageEntityGetId,
  getLinks: _isarConfirmedMessageEntityGetLinks,
  attach: _isarConfirmedMessageEntityAttach,
  version: '3.1.0+1',
);

int _isarConfirmedMessageEntityEstimateSize(
  IsarConfirmedMessageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdByEventId.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _isarConfirmedMessageEntitySerialize(
  IsarConfirmedMessageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.createdByEventId);
  writer.writeLong(offsets[3], object.createdByRecordNumber);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeLong(offsets[5], object.lastUpdatedByRecordNumber);
  writer.writeString(offsets[6], object.type.name);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

IsarConfirmedMessageEntity _isarConfirmedMessageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarConfirmedMessageEntity();
  object.content = reader.readByte(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.createdByEventId = reader.readString(offsets[2]);
  object.createdByRecordNumber = reader.readLongOrNull(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.lastUpdatedByRecordNumber = reader.readLongOrNull(offsets[5]);
  object.type = _IsarConfirmedMessageEntitytypeValueEnumMap[
          reader.readStringOrNull(offsets[6])] ??
      MessageType.text;
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _isarConfirmedMessageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByte(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_IsarConfirmedMessageEntitytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MessageType.text) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarConfirmedMessageEntitytypeEnumValueMap = {
  r'text': r'text',
  r'photo': r'photo',
  r'video': r'video',
  r'file': r'file',
  r'miniApp': r'miniApp',
};
const _IsarConfirmedMessageEntitytypeValueEnumMap = {
  r'text': MessageType.text,
  r'photo': MessageType.photo,
  r'video': MessageType.video,
  r'file': MessageType.file,
  r'miniApp': MessageType.miniApp,
};

Id _isarConfirmedMessageEntityGetId(IsarConfirmedMessageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarConfirmedMessageEntityGetLinks(
    IsarConfirmedMessageEntity object) {
  return [object.owner, object.room];
}

void _isarConfirmedMessageEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarConfirmedMessageEntity object) {
  object.id = id;
  object.owner.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'owner', id);
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
}

extension IsarConfirmedMessageEntityQueryWhereSort on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QWhere> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarConfirmedMessageEntityQueryWhere on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QWhereClause> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarConfirmedMessageEntityQueryFilter on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QFilterCondition> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> contentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> contentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> contentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> contentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdByEventId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
          QAfterFilterCondition>
      createdByEventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdByEventId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
          QAfterFilterCondition>
      createdByEventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdByEventId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdByRecordNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdatedByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdatedByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdatedByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdatedByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdatedByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdatedByRecordNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeEqualTo(
    MessageType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeGreaterThan(
    MessageType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeLessThan(
    MessageType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeBetween(
    MessageType lower,
    MessageType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarConfirmedMessageEntityQueryObject on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QFilterCondition> {}

extension IsarConfirmedMessageEntityQueryLinks on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QFilterCondition> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> owner(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension IsarConfirmedMessageEntityQuerySortBy on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QSortBy> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByLastUpdatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarConfirmedMessageEntityQuerySortThenBy on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QSortThenBy> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByLastUpdatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarConfirmedMessageEntityQueryWhereDistinct on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QDistinct> {
  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByCreatedByEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByRecordNumber');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedByRecordNumber');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, IsarConfirmedMessageEntity,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarConfirmedMessageEntityQueryProperty on QueryBuilder<
    IsarConfirmedMessageEntity, IsarConfirmedMessageEntity, QQueryProperty> {
  QueryBuilder<IsarConfirmedMessageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, int, QQueryOperations>
      contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, String, QQueryOperations>
      createdByEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByEventId');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, int?, QQueryOperations>
      createdByRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByRecordNumber');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, int?, QQueryOperations>
      lastUpdatedByRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedByRecordNumber');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, MessageType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarConfirmedMessageEntity, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
