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
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'roomId': PropertySchema(
      id: 1,
      name: r'roomId',
      type: IsarType.long,
    ),
    r'thumbnail': PropertySchema(
      id: 2,
      name: r'thumbnail',
      type: IsarType.string,
    )
  },
  estimateSize: _isarChatRoomEntityEstimateSize,
  serialize: _isarChatRoomEntitySerialize,
  deserialize: _isarChatRoomEntityDeserialize,
  deserializeProp: _isarChatRoomEntityDeserializeProp,
  idName: r'id',
  indexes: {},
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
  bytesCount += 3 + object.thumbnail.length * 3;
  return bytesCount;
}

void _isarChatRoomEntitySerialize(
  IsarChatRoomEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeLong(offsets[1], object.roomId);
  writer.writeString(offsets[2], object.thumbnail);
}

IsarChatRoomEntity _isarChatRoomEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChatRoomEntity();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.roomId = reader.readLong(offsets[1]);
  object.thumbnail = reader.readString(offsets[2]);
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
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
}

extension IsarChatRoomEntityQueryFilter
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {
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
      roomIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      roomIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      thumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnail',
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
      sortByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      sortByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }
}

extension IsarChatRoomEntityQuerySortThenBy
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QSortThenBy> {
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
      thenByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }
}

extension IsarChatRoomEntityQueryWhereDistinct
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomId');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct>
      distinctByThumbnail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnail', caseSensitive: caseSensitive);
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

  QueryBuilder<IsarChatRoomEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarChatRoomEntity, int, QQueryOperations> roomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomId');
    });
  }

  QueryBuilder<IsarChatRoomEntity, String, QQueryOperations>
      thumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnail');
    });
  }
}
