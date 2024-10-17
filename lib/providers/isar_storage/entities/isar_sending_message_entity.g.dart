// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_sending_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSendingMessageEntityCollection on Isar {
  IsarCollection<IsarSendingMessageEntity> get isarSendingMessageEntitys =>
      this.collection();
}

const IsarSendingMessageEntitySchema = CollectionSchema(
  name: r'SendingMessage',
  id: -4491772862651078313,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.byteList,
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
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _IsarSendingMessageEntitytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarSendingMessageEntityEstimateSize,
  serialize: _isarSendingMessageEntitySerialize,
  deserialize: _isarSendingMessageEntityDeserialize,
  deserializeProp: _isarSendingMessageEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdByEventId': IndexSchema(
      id: -1786545763247957892,
      name: r'createdByEventId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdByEventId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'owner': LinkSchema(
      id: -2239134829242211396,
      name: r'owner',
      target: r'ChatRoomMember',
      single: true,
    ),
    r'room': LinkSchema(
      id: -4966878042550786311,
      name: r'room',
      target: r'ChatRoom',
      single: true,
      linkName: r'sendingMessages',
    )
  },
  embeddedSchemas: {},
  getId: _isarSendingMessageEntityGetId,
  getLinks: _isarSendingMessageEntityGetLinks,
  attach: _isarSendingMessageEntityAttach,
  version: '3.1.0+1',
);

int _isarSendingMessageEntityEstimateSize(
  IsarSendingMessageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length;
  bytesCount += 3 + object.createdByEventId.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _isarSendingMessageEntitySerialize(
  IsarSendingMessageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.createdByEventId);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.type.name);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

IsarSendingMessageEntity _isarSendingMessageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSendingMessageEntity();
  object.content = reader.readByteList(offsets[0]) ?? [];
  object.createdAt = reader.readDateTime(offsets[1]);
  object.createdByEventId = reader.readString(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.type = _IsarSendingMessageEntitytypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      MessageType.memberText;
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _isarSendingMessageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_IsarSendingMessageEntitytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MessageType.memberText) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarSendingMessageEntitytypeEnumValueMap = {
  r'memberText': r'memberText',
  r'memberTextReply': r'memberTextReply',
  r'memberPhoto': r'memberPhoto',
  r'memberVideo': r'memberVideo',
  r'memberFile': r'memberFile',
  r'memberMiniApp': r'memberMiniApp',
  r'activityLogCreateRoom': r'activityLogCreateRoom',
  r'activityLogUpdateRoom': r'activityLogUpdateRoom',
  r'activityLogInviteMember': r'activityLogInviteMember',
  r'activityLogUpdateMemberRole': r'activityLogUpdateMemberRole',
  r'activityLogUninviteMember': r'activityLogUninviteMember',
};
const _IsarSendingMessageEntitytypeValueEnumMap = {
  r'memberText': MessageType.memberText,
  r'memberTextReply': MessageType.memberTextReply,
  r'memberPhoto': MessageType.memberPhoto,
  r'memberVideo': MessageType.memberVideo,
  r'memberFile': MessageType.memberFile,
  r'memberMiniApp': MessageType.memberMiniApp,
  r'activityLogCreateRoom': MessageType.activityLogCreateRoom,
  r'activityLogUpdateRoom': MessageType.activityLogUpdateRoom,
  r'activityLogInviteMember': MessageType.activityLogInviteMember,
  r'activityLogUpdateMemberRole': MessageType.activityLogUpdateMemberRole,
  r'activityLogUninviteMember': MessageType.activityLogUninviteMember,
};

Id _isarSendingMessageEntityGetId(IsarSendingMessageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSendingMessageEntityGetLinks(
    IsarSendingMessageEntity object) {
  return [object.owner, object.room];
}

void _isarSendingMessageEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarSendingMessageEntity object) {
  object.id = id;
  object.owner.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'owner', id);
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
}

extension IsarSendingMessageEntityByIndex
    on IsarCollection<IsarSendingMessageEntity> {
  Future<IsarSendingMessageEntity?> getByCreatedByEventId(
      String createdByEventId) {
    return getByIndex(r'createdByEventId', [createdByEventId]);
  }

  IsarSendingMessageEntity? getByCreatedByEventIdSync(String createdByEventId) {
    return getByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<bool> deleteByCreatedByEventId(String createdByEventId) {
    return deleteByIndex(r'createdByEventId', [createdByEventId]);
  }

  bool deleteByCreatedByEventIdSync(String createdByEventId) {
    return deleteByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<List<IsarSendingMessageEntity?>> getAllByCreatedByEventId(
      List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'createdByEventId', values);
  }

  List<IsarSendingMessageEntity?> getAllByCreatedByEventIdSync(
      List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'createdByEventId', values);
  }

  Future<int> deleteAllByCreatedByEventId(List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'createdByEventId', values);
  }

  int deleteAllByCreatedByEventIdSync(List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'createdByEventId', values);
  }

  Future<Id> putByCreatedByEventId(IsarSendingMessageEntity object) {
    return putByIndex(r'createdByEventId', object);
  }

  Id putByCreatedByEventIdSync(IsarSendingMessageEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'createdByEventId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCreatedByEventId(
      List<IsarSendingMessageEntity> objects) {
    return putAllByIndex(r'createdByEventId', objects);
  }

  List<Id> putAllByCreatedByEventIdSync(List<IsarSendingMessageEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'createdByEventId', objects,
        saveLinks: saveLinks);
  }
}

extension IsarSendingMessageEntityQueryWhereSort on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QWhere> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSendingMessageEntityQueryWhere on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QWhereClause> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterWhereClause> createdByEventIdEqualTo(String createdByEventId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdByEventId',
        value: [createdByEventId],
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterWhereClause> createdByEventIdNotEqualTo(String createdByEventId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByEventId',
              lower: [],
              upper: [createdByEventId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByEventId',
              lower: [createdByEventId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByEventId',
              lower: [createdByEventId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByEventId',
              lower: [],
              upper: [createdByEventId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarSendingMessageEntityQueryFilter on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QFilterCondition> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentElementGreaterThan(
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentElementLessThan(
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentElementBetween(
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> contentLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'content',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> createdByEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> createdByEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
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

extension IsarSendingMessageEntityQueryObject on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QFilterCondition> {}

extension IsarSendingMessageEntityQueryLinks on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QFilterCondition> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> owner(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity,
      QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension IsarSendingMessageEntityQuerySortBy on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QSortBy> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarSendingMessageEntityQuerySortThenBy on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QSortThenBy> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarSendingMessageEntityQueryWhereDistinct on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct> {
  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByCreatedByEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSendingMessageEntity, IsarSendingMessageEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarSendingMessageEntityQueryProperty on QueryBuilder<
    IsarSendingMessageEntity, IsarSendingMessageEntity, QQueryProperty> {
  QueryBuilder<IsarSendingMessageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, List<int>, QQueryOperations>
      contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, String, QQueryOperations>
      createdByEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByEventId');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, MessageType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarSendingMessageEntity, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
