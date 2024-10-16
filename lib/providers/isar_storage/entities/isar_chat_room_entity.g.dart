// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_chat_room_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarChatRoomEntityCollection on Isar {
  IsarCollection<IsarChatRoomEntity> get isarChatRoomEntitys =>
      this.collection();
}

const IsarChatRoomEntitySchema = CollectionSchema(
  name: r'ChatRoom',
  id: 3645375135519982771,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'lastSyncedRoomAndMessageEventRecordNumber': PropertySchema(
      id: 1,
      name: r'lastSyncedRoomAndMessageEventRecordNumber',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'profileHash': PropertySchema(
      id: 3,
      name: r'profileHash',
      type: IsarType.string,
    ),
    r'roomId': PropertySchema(
      id: 4,
      name: r'roomId',
      type: IsarType.string,
    ),
    r'thumbnailUrl': PropertySchema(
      id: 5,
      name: r'thumbnailUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _isarChatRoomEntityEstimateSize,
  serialize: _isarChatRoomEntitySerialize,
  deserialize: _isarChatRoomEntityDeserialize,
  deserializeProp: _isarChatRoomEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'roomId': IndexSchema(
      id: -3609232324653216207,
      name: r'roomId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'roomId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'confirmedMessages': LinkSchema(
      id: 6743315523710509014,
      name: r'confirmedMessages',
      target: r'ConfirmedMessage',
      single: false,
    ),
    r'unconfirmedMessages': LinkSchema(
      id: 4979327497624168994,
      name: r'unconfirmedMessages',
      target: r'UnconfirmedMessage',
      single: false,
    ),
    r'sendingMessages': LinkSchema(
      id: 91798376322844008,
      name: r'sendingMessages',
      target: r'SendingMessage',
      single: false,
    ),
    r'failedMessages': LinkSchema(
      id: 5944668562965277322,
      name: r'failedMessages',
      target: r'FailedMessage',
      single: false,
    ),
    r'members': LinkSchema(
      id: -1578615771921630991,
      name: r'members',
      target: r'ChatRoomMember',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarChatRoomEntityGetId,
  getLinks: _isarChatRoomEntityGetLinks,
  attach: _isarChatRoomEntityAttach,
  version: '3.1.0+1',
);

int _isarChatRoomEntityEstimateSize(
  IsarChatRoomEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.profileHash.length * 3;
  bytesCount += 3 + object.roomId.length * 3;
  {
    final value = object.thumbnailUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarChatRoomEntitySerialize(
  IsarChatRoomEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeLong(
      offsets[1], object.lastSyncedRoomAndMessageEventRecordNumber);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.profileHash);
  writer.writeString(offsets[4], object.roomId);
  writer.writeString(offsets[5], object.thumbnailUrl);
}

IsarChatRoomEntity _isarChatRoomEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChatRoomEntity();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.lastSyncedRoomAndMessageEventRecordNumber =
      reader.readLong(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.profileHash = reader.readString(offsets[3]);
  object.roomId = reader.readString(offsets[4]);
  object.thumbnailUrl = reader.readStringOrNull(offsets[5]);
  return object;
}

P _isarChatRoomEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarChatRoomEntityGetId(IsarChatRoomEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarChatRoomEntityGetLinks(
    IsarChatRoomEntity object) {
  return [
    object.confirmedMessages,
    object.unconfirmedMessages,
    object.sendingMessages,
    object.failedMessages,
    object.members
  ];
}

void _isarChatRoomEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarChatRoomEntity object) {
  object.id = id;
  object.confirmedMessages.attach(
      col,
      col.isar.collection<IsarConfirmedMessageEntity>(),
      r'confirmedMessages',
      id);
  object.unconfirmedMessages.attach(
      col,
      col.isar.collection<IsarUnconfirmedMessageEntity>(),
      r'unconfirmedMessages',
      id);
  object.sendingMessages.attach(col,
      col.isar.collection<IsarSendingMessageEntity>(), r'sendingMessages', id);
  object.failedMessages.attach(col,
      col.isar.collection<IsarFailedMessageEntity>(), r'failedMessages', id);
  object.members.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'members', id);
}

extension IsarChatRoomEntityByIndex on IsarCollection<IsarChatRoomEntity> {
  Future<IsarChatRoomEntity?> getByRoomId(String roomId) {
    return getByIndex(r'roomId', [roomId]);
  }

  IsarChatRoomEntity? getByRoomIdSync(String roomId) {
    return getByIndexSync(r'roomId', [roomId]);
  }

  Future<bool> deleteByRoomId(String roomId) {
    return deleteByIndex(r'roomId', [roomId]);
  }

  bool deleteByRoomIdSync(String roomId) {
    return deleteByIndexSync(r'roomId', [roomId]);
  }

  Future<List<IsarChatRoomEntity?>> getAllByRoomId(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'roomId', values);
  }

  List<IsarChatRoomEntity?> getAllByRoomIdSync(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'roomId', values);
  }

  Future<int> deleteAllByRoomId(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'roomId', values);
  }

  int deleteAllByRoomIdSync(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'roomId', values);
  }

  Future<Id> putByRoomId(IsarChatRoomEntity object) {
    return putByIndex(r'roomId', object);
  }

  Id putByRoomIdSync(IsarChatRoomEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'roomId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRoomId(List<IsarChatRoomEntity> objects) {
    return putAllByIndex(r'roomId', objects);
  }

  List<Id> putAllByRoomIdSync(List<IsarChatRoomEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'roomId', objects, saveLinks: saveLinks);
  }
}

extension IsarChatRoomEntityQueryWhereSort
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QWhere> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarChatRoomEntityQueryWhere
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QWhereClause> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      roomIdEqualTo(String roomId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'roomId',
        value: [roomId],
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      roomIdNotEqualTo(String roomId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarChatRoomEntityQueryFilter
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtGreaterThan(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtLessThan(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      deletedAtBetween(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      lastSyncedRoomAndMessageEventRecordNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedRoomAndMessageEventRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      lastSyncedRoomAndMessageEventRecordNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedRoomAndMessageEventRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      lastSyncedRoomAndMessageEventRecordNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedRoomAndMessageEventRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      lastSyncedRoomAndMessageEventRecordNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedRoomAndMessageEventRecordNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profileHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profileHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profileHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileHash',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      profileHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profileHash',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnailUrl',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnailUrl',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnailUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }
}

extension IsarChatRoomEntityQueryObject
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {}

extension IsarChatRoomEntityQueryLinks
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessages(FilterQuery<IsarConfirmedMessageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'confirmedMessages');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'confirmedMessages', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'confirmedMessages', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'confirmedMessages', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'confirmedMessages', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'confirmedMessages', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      confirmedMessagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'confirmedMessages', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessages(FilterQuery<IsarUnconfirmedMessageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'unconfirmedMessages');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'unconfirmedMessages', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'unconfirmedMessages', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'unconfirmedMessages', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'unconfirmedMessages', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'unconfirmedMessages', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      unconfirmedMessagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'unconfirmedMessages', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessages(FilterQuery<IsarSendingMessageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sendingMessages');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sendingMessages', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sendingMessages', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sendingMessages', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sendingMessages', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sendingMessages', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      sendingMessagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sendingMessages', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessages(FilterQuery<IsarFailedMessageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'failedMessages');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'failedMessages', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'failedMessages', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'failedMessages', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'failedMessages', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'failedMessages', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      failedMessagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'failedMessages', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      members(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'members');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'members', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarChatRoomEntityQuerySortBy
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QSortBy> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByLastSyncedRoomAndMessageEventRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'lastSyncedRoomAndMessageEventRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByLastSyncedRoomAndMessageEventRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'lastSyncedRoomAndMessageEventRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByProfileHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileHash', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByProfileHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileHash', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }
}

extension IsarChatRoomEntityQuerySortThenBy
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QSortThenBy> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByLastSyncedRoomAndMessageEventRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'lastSyncedRoomAndMessageEventRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByLastSyncedRoomAndMessageEventRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'lastSyncedRoomAndMessageEventRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByProfileHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileHash', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByProfileHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileHash', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }
}

extension IsarChatRoomEntityQueryWhereDistinct
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByLastSyncedRoomAndMessageEventRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedRoomAndMessageEventRecordNumber');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByProfileHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByRoomId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByThumbnailUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailUrl', caseSensitive: caseSensitive);
    });
  }
}

extension IsarChatRoomEntityQueryProperty
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QQueryProperty> {
  QueryBuilder<IsarChatRoomEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarChatRoomEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarChatRoomEntity, int, QQueryOperations>
      lastSyncedRoomAndMessageEventRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query
          .addPropertyName(r'lastSyncedRoomAndMessageEventRecordNumber');
    });
  }

  QueryBuilder<IsarChatRoomEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarChatRoomEntity, String, QQueryOperations>
      profileHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileHash');
    });
  }

  QueryBuilder<IsarChatRoomEntity, String, QQueryOperations> roomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomId');
    });
  }

  QueryBuilder<IsarChatRoomEntity, String?, QQueryOperations>
      thumbnailUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailUrl');
    });
  }
}
