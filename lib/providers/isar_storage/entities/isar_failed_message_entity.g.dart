// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_failed_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarFailedMessageEntityCollection on Isar {
  IsarCollection<IsarFailedMessageEntity> get isarFailedMessageEntitys =>
      this.collection();
}

const IsarFailedMessageEntitySchema = CollectionSchema(
  name: r'FailedMessage',
  id: -5630906417373160459,
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
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _IsarFailedMessageEntitytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarFailedMessageEntityEstimateSize,
  serialize: _isarFailedMessageEntitySerialize,
  deserialize: _isarFailedMessageEntityDeserialize,
  deserializeProp: _isarFailedMessageEntityDeserializeProp,
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
      id: 767970643394339279,
      name: r'owner',
      target: r'ChatRoomMember',
      single: true,
    ),
    r'room': LinkSchema(
      id: -263052131625526532,
      name: r'room',
      target: r'ChatRoom',
      single: true,
      linkName: r'failedMessages',
    )
  },
  embeddedSchemas: {},
  getId: _isarFailedMessageEntityGetId,
  getLinks: _isarFailedMessageEntityGetLinks,
  attach: _isarFailedMessageEntityAttach,
  version: '3.1.0+1',
);

int _isarFailedMessageEntityEstimateSize(
  IsarFailedMessageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdByEventId.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _isarFailedMessageEntitySerialize(
  IsarFailedMessageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.createdByEventId);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.type.name);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

IsarFailedMessageEntity _isarFailedMessageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarFailedMessageEntity();
  object.content = reader.readByte(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.createdByEventId = reader.readString(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.type = _IsarFailedMessageEntitytypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      MessageType.text;
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _isarFailedMessageEntityDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_IsarFailedMessageEntitytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MessageType.text) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarFailedMessageEntitytypeEnumValueMap = {
  r'text': r'text',
  r'photo': r'photo',
  r'video': r'video',
  r'file': r'file',
  r'miniApp': r'miniApp',
};
const _IsarFailedMessageEntitytypeValueEnumMap = {
  r'text': MessageType.text,
  r'photo': MessageType.photo,
  r'video': MessageType.video,
  r'file': MessageType.file,
  r'miniApp': MessageType.miniApp,
};

Id _isarFailedMessageEntityGetId(IsarFailedMessageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarFailedMessageEntityGetLinks(
    IsarFailedMessageEntity object) {
  return [object.owner, object.room];
}

void _isarFailedMessageEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarFailedMessageEntity object) {
  object.id = id;
  object.owner.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'owner', id);
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
}

extension IsarFailedMessageEntityByIndex
    on IsarCollection<IsarFailedMessageEntity> {
  Future<IsarFailedMessageEntity?> getByCreatedByEventId(
      String createdByEventId) {
    return getByIndex(r'createdByEventId', [createdByEventId]);
  }

  IsarFailedMessageEntity? getByCreatedByEventIdSync(String createdByEventId) {
    return getByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<bool> deleteByCreatedByEventId(String createdByEventId) {
    return deleteByIndex(r'createdByEventId', [createdByEventId]);
  }

  bool deleteByCreatedByEventIdSync(String createdByEventId) {
    return deleteByIndexSync(r'createdByEventId', [createdByEventId]);
  }

  Future<List<IsarFailedMessageEntity?>> getAllByCreatedByEventId(
      List<String> createdByEventIdValues) {
    final values = createdByEventIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'createdByEventId', values);
  }

  List<IsarFailedMessageEntity?> getAllByCreatedByEventIdSync(
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

  Future<Id> putByCreatedByEventId(IsarFailedMessageEntity object) {
    return putByIndex(r'createdByEventId', object);
  }

  Id putByCreatedByEventIdSync(IsarFailedMessageEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'createdByEventId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCreatedByEventId(
      List<IsarFailedMessageEntity> objects) {
    return putAllByIndex(r'createdByEventId', objects);
  }

  List<Id> putAllByCreatedByEventIdSync(List<IsarFailedMessageEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'createdByEventId', objects,
        saveLinks: saveLinks);
  }
}

extension IsarFailedMessageEntityQueryWhereSort
    on QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QWhere> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarFailedMessageEntityQueryWhere on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QWhereClause> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterWhereClause> createdByEventIdEqualTo(String createdByEventId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdByEventId',
        value: [createdByEventId],
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

extension IsarFailedMessageEntityQueryFilter on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QFilterCondition> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> contentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> createdByEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdByEventId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
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

extension IsarFailedMessageEntityQueryObject on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QFilterCondition> {}

extension IsarFailedMessageEntityQueryLinks on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QFilterCondition> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> owner(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity,
      QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension IsarFailedMessageEntityQuerySortBy
    on QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QSortBy> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarFailedMessageEntityQuerySortThenBy on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QSortThenBy> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByCreatedByEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByCreatedByEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdByEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarFailedMessageEntityQueryWhereDistinct on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct> {
  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByCreatedByEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdByEventId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFailedMessageEntity, IsarFailedMessageEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarFailedMessageEntityQueryProperty on QueryBuilder<
    IsarFailedMessageEntity, IsarFailedMessageEntity, QQueryProperty> {
  QueryBuilder<IsarFailedMessageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, int, QQueryOperations>
      contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, String, QQueryOperations>
      createdByEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdByEventId');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, MessageType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarFailedMessageEntity, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
