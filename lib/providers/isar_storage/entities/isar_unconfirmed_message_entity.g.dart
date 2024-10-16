// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_unconfirmed_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarUnconfirmedMessageEntityCollection on Isar {
  IsarCollection<IsarUnconfirmedMessageEntity>
      get isarUnconfirmedMessageEntitys => this.collection();
}

const IsarUnconfirmedMessageEntitySchema = CollectionSchema(
  name: r'UnconfirmedMessage',
  id: -5041196965332864588,
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
      enumMap: _IsarUnconfirmedMessageEntitytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarUnconfirmedMessageEntityEstimateSize,
  serialize: _isarUnconfirmedMessageEntitySerialize,
  deserialize: _isarUnconfirmedMessageEntityDeserialize,
  deserializeProp: _isarUnconfirmedMessageEntityDeserializeProp,
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
    ),
    r'createdByRecordNumber': IndexSchema(
      id: -802686535216475452,
      name: r'createdByRecordNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdByRecordNumber',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'owner': LinkSchema(
      id: 2715873549782930735,
      name: r'owner',
      target: r'ChatRoomMember',
      single: true,
    ),
    r'room': LinkSchema(
      id: 3827988732257500280,
      name: r'room',
      target: r'ChatRoom',
      single: true,
      linkName: r'unconfirmedMessages',
    )
  },
  embeddedSchemas: {},
  getId: _isarUnconfirmedMessageEntityGetId,
  getLinks: _isarUnconfirmedMessageEntityGetLinks,
  attach: _isarUnconfirmedMessageEntityAttach,
  version: '3.1.0+1',
);

int _isarUnconfirmedMessageEntityEstimateSize(
  IsarUnconfirmedMessageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.createdByEventId.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _isarUnconfirmedMessageEntitySerialize(
  IsarUnconfirmedMessageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.createdByEventId);
  writer.writeLong(offsets[3], object.createdByRecordNumber);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeLong(offsets[5], object.lastUpdatedByRecordNumber);
  writer.writeString(offsets[6], object.type.name);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

IsarUnconfirmedMessageEntity _isarUnconfirmedMessageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarUnconfirmedMessageEntity();
  object.content = reader.readByteList(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.createdByEventId = reader.readString(offsets[2]);
  object.createdByRecordNumber = reader.readLongOrNull(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.lastUpdatedByRecordNumber = reader.readLongOrNull(offsets[5]);
  object.type = _IsarUnconfirmedMessageEntitytypeValueEnumMap[
          reader.readStringOrNull(offsets[6])] ??
      MessageType.memberText;
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _isarUnconfirmedMessageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
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
      return (_IsarUnconfirmedMessageEntitytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MessageType.memberText) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarUnconfirmedMessageEntitytypeEnumValueMap = {
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
const _IsarUnconfirmedMessageEntitytypeValueEnumMap = {
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

Id _isarUnconfirmedMessageEntityGetId(IsarUnconfirmedMessageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarUnconfirmedMessageEntityGetLinks(
    IsarUnconfirmedMessageEntity object) {
  return [object.owner, object.room];
}

void _isarUnconfirmedMessageEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarUnconfirmedMessageEntity object) {
  object.id = id;
  object.owner.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'owner', id);
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
}

extension IsarUnconfirmedMessageEntityByIndex
    on IsarCollection<IsarUnconfirmedMessageEntity> {
  Future<IsarUnconfirmedMessageEntity?> getByCreatedByEventId(
      String createdByEventId) {
    return getByIndex(r'createdByEventId', [createdByEventId]);
  }

  IsarUnconfirmedMessageEntity? getByCreatedByEventIdSync(
      String createdByEventId) {
    return getByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<bool> deleteByCreatedByEventId(String createdByEventId) {
    return deleteByIndex(r'createdByEventId', [createdByEventId]);
  }

  bool deleteByCreatedByEventIdSync(String createdByEventId) {
    return deleteByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<List<IsarUnconfirmedMessageEntity?>> getAllByCreatedByEventId(
      List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'createdByEventId', values);
  }

  List<IsarUnconfirmedMessageEntity?> getAllByCreatedByEventIdSync(
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

  Future<Id> putByCreatedByEventId(IsarUnconfirmedMessageEntity object) {
    return putByIndex(r'createdByEventId', object);
  }

  Id putByCreatedByEventIdSync(IsarUnconfirmedMessageEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'createdByEventId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCreatedByEventId(
      List<IsarUnconfirmedMessageEntity> objects) {
    return putAllByIndex(r'createdByEventId', objects);
  }

  List<Id> putAllByCreatedByEventIdSync(
      List<IsarUnconfirmedMessageEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'createdByEventId', objects,
        saveLinks: saveLinks);
  }

  Future<IsarUnconfirmedMessageEntity?> getByCreatedByRecordNumber(
      int? createdByRecordNumber) {
    return getByIndex(r'createdByRecordNumber', [createdByRecordNumber]);
  }

  IsarUnconfirmedMessageEntity? getByCreatedByRecordNumberSync(
      int? createdByRecordNumber) {
    return getByIndexSync(r'createdByRecordNumber', [createdByRecordNumber]);
  }

  Future<bool> deleteByCreatedByRecordNumber(int? createdByRecordNumber) {
    return deleteByIndex(r'createdByRecordNumber', [createdByRecordNumber]);
  }

  bool deleteByCreatedByRecordNumberSync(int? createdByRecordNumber) {
    return deleteByIndexSync(r'createdByRecordNumber', [createdByRecordNumber]);
  }

  Future<List<IsarUnconfirmedMessageEntity?>> getAllByCreatedByRecordNumber(
      List<int?> createdByRecordNumberValues) {
    final values = createdByRecordNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'createdByRecordNumber', values);
  }

  List<IsarUnconfirmedMessageEntity?> getAllByCreatedByRecordNumberSync(
      List<int?> createdByRecordNumberValues) {
    final values = createdByRecordNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'createdByRecordNumber', values);
  }

  Future<int> deleteAllByCreatedByRecordNumber(
      List<int?> createdByRecordNumberValues) {
    final values = createdByRecordNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'createdByRecordNumber', values);
  }

  int deleteAllByCreatedByRecordNumberSync(
      List<int?> createdByRecordNumberValues) {
    final values = createdByRecordNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'createdByRecordNumber', values);
  }

  Future<Id> putByCreatedByRecordNumber(IsarUnconfirmedMessageEntity object) {
    return putByIndex(r'createdByRecordNumber', object);
  }

  Id putByCreatedByRecordNumberSync(IsarUnconfirmedMessageEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'createdByRecordNumber', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCreatedByRecordNumber(
      List<IsarUnconfirmedMessageEntity> objects) {
    return putAllByIndex(r'createdByRecordNumber', objects);
  }

  List<Id> putAllByCreatedByRecordNumberSync(
      List<IsarUnconfirmedMessageEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'createdByRecordNumber', objects,
        saveLinks: saveLinks);
  }
}

extension IsarUnconfirmedMessageEntityQueryWhereSort on QueryBuilder<
    IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity, QWhere> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhere> anyCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdByRecordNumber'),
      );
    });
  }
}

extension IsarUnconfirmedMessageEntityQueryWhere on QueryBuilder<
    IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity, QWhereClause> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByEventIdEqualTo(String createdByEventId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdByEventId',
        value: [createdByEventId],
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByRecordNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdByRecordNumber',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByRecordNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdByRecordNumber',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
          QAfterWhereClause>
      createdByRecordNumberEqualTo(int? createdByRecordNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdByRecordNumber',
        value: [createdByRecordNumber],
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
          QAfterWhereClause>
      createdByRecordNumberNotEqualTo(int? createdByRecordNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByRecordNumber',
              lower: [],
              upper: [createdByRecordNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByRecordNumber',
              lower: [createdByRecordNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByRecordNumber',
              lower: [createdByRecordNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdByRecordNumber',
              lower: [],
              upper: [createdByRecordNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByRecordNumberGreaterThan(
    int? createdByRecordNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdByRecordNumber',
        lower: [createdByRecordNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByRecordNumberLessThan(
    int? createdByRecordNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdByRecordNumber',
        lower: [],
        upper: [createdByRecordNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterWhereClause> createdByRecordNumberBetween(
    int? lowerCreatedByRecordNumber,
    int? upperCreatedByRecordNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdByRecordNumber',
        lower: [lowerCreatedByRecordNumber],
        includeLower: includeLower,
        upper: [upperCreatedByRecordNumber],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarUnconfirmedMessageEntityQueryFilter on QueryBuilder<
    IsarUnconfirmedMessageEntity,
    IsarUnconfirmedMessageEntity,
    QFilterCondition> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> contentElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> createdByRecordNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdatedByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdatedByRecordNumber',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> lastUpdatedByRecordNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdatedByRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
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

extension IsarUnconfirmedMessageEntityQueryObject on QueryBuilder<
    IsarUnconfirmedMessageEntity,
    IsarUnconfirmedMessageEntity,
    QFilterCondition> {}

extension IsarUnconfirmedMessageEntityQueryLinks on QueryBuilder<
    IsarUnconfirmedMessageEntity,
    IsarUnconfirmedMessageEntity,
    QFilterCondition> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> owner(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension IsarUnconfirmedMessageEntityQuerySortBy on QueryBuilder<
    IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity, QSortBy> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByCreatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByLastUpdatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarUnconfirmedMessageEntityQuerySortThenBy on QueryBuilder<
    IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity, QSortThenBy> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByCreatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByLastUpdatedByRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedByRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarUnconfirmedMessageEntityQueryWhereDistinct on QueryBuilder<
    IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity, QDistinct> {
  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByCreatedByEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByCreatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByRecordNumber');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByLastUpdatedByRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedByRecordNumber');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, IsarUnconfirmedMessageEntity,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarUnconfirmedMessageEntityQueryProperty on QueryBuilder<
    IsarUnconfirmedMessageEntity,
    IsarUnconfirmedMessageEntity,
    QQueryProperty> {
  QueryBuilder<IsarUnconfirmedMessageEntity, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, List<int>?, QQueryOperations>
      contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, String, QQueryOperations>
      createdByEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByEventId');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, int?, QQueryOperations>
      createdByRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByRecordNumber');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, int?, QQueryOperations>
      lastUpdatedByRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedByRecordNumber');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, MessageType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarUnconfirmedMessageEntity, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
