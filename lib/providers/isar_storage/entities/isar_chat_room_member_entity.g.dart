// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_chat_room_member_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarChatRoomMemberEntityCollection on Isar {
  IsarCollection<IsarChatRoomMemberEntity> get isarChatRoomMemberEntitys =>
      this.collection();
}

const IsarChatRoomMemberEntitySchema = CollectionSchema(
  name: r'ChatRoomMember',
  id: -5949278034160924675,
  properties: {
    r'lastReadMessageRecordNumber': PropertySchema(
      id: 0,
      name: r'lastReadMessageRecordNumber',
      type: IsarType.long,
    ),
    r'memberId': PropertySchema(
      id: 1,
      name: r'memberId',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 2,
      name: r'role',
      type: IsarType.string,
      enumMap: _IsarChatRoomMemberEntityroleEnumValueMap,
    )
  },
  estimateSize: _isarChatRoomMemberEntityEstimateSize,
  serialize: _isarChatRoomMemberEntitySerialize,
  deserialize: _isarChatRoomMemberEntityDeserialize,
  deserializeProp: _isarChatRoomMemberEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'memberId': IndexSchema(
      id: 5707689632932325803,
      name: r'memberId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'memberId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'rueJaiUser': LinkSchema(
      id: -7145962735411436187,
      name: r'rueJaiUser',
      target: r'RueJaiUser',
      single: true,
    ),
    r'room': LinkSchema(
      id: -7522219357351002365,
      name: r'room',
      target: r'ChatRoom',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _isarChatRoomMemberEntityGetId,
  getLinks: _isarChatRoomMemberEntityGetLinks,
  attach: _isarChatRoomMemberEntityAttach,
  version: '3.1.0+1',
);

int _isarChatRoomMemberEntityEstimateSize(
  IsarChatRoomMemberEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.memberId.length * 3;
  bytesCount += 3 + object.role.name.length * 3;
  return bytesCount;
}

void _isarChatRoomMemberEntitySerialize(
  IsarChatRoomMemberEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastReadMessageRecordNumber);
  writer.writeString(offsets[1], object.memberId);
  writer.writeString(offsets[2], object.role.name);
}

IsarChatRoomMemberEntity _isarChatRoomMemberEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChatRoomMemberEntity();
  object.id = id;
  object.lastReadMessageRecordNumber = reader.readLong(offsets[0]);
  object.memberId = reader.readString(offsets[1]);
  object.role = _IsarChatRoomMemberEntityroleValueEnumMap[
          reader.readStringOrNull(offsets[2])] ??
      ChatRoomMemberRole.admin;
  return object;
}

P _isarChatRoomMemberEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_IsarChatRoomMemberEntityroleValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ChatRoomMemberRole.admin) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarChatRoomMemberEntityroleEnumValueMap = {
  r'admin': r'admin',
  r'member': r'member',
};
const _IsarChatRoomMemberEntityroleValueEnumMap = {
  r'admin': ChatRoomMemberRole.admin,
  r'member': ChatRoomMemberRole.member,
};

Id _isarChatRoomMemberEntityGetId(IsarChatRoomMemberEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarChatRoomMemberEntityGetLinks(
    IsarChatRoomMemberEntity object) {
  return [object.rueJaiUser, object.room];
}

void _isarChatRoomMemberEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarChatRoomMemberEntity object) {
  object.id = id;
  object.rueJaiUser.attach(
      col, col.isar.collection<IsarRueJaiUserEntity>(), r'rueJaiUser', id);
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
}

extension IsarChatRoomMemberEntityByIndex
    on IsarCollection<IsarChatRoomMemberEntity> {
  Future<IsarChatRoomMemberEntity?> getByMemberId(String memberId) {
    return getByIndex(r'memberId', [memberId]);
  }

  IsarChatRoomMemberEntity? getByMemberIdSync(String memberId) {
    return getByIndexSync(r'memberId', [memberId]);
  }

  Future<bool> deleteByMemberId(String memberId) {
    return deleteByIndex(r'memberId', [memberId]);
  }

  bool deleteByMemberIdSync(String memberId) {
    return deleteByIndexSync(r'memberId', [memberId]);
  }

  Future<List<IsarChatRoomMemberEntity?>> getAllByMemberId(
      List<String> memberIdValues) {
    final values = memberIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'memberId', values);
  }

  List<IsarChatRoomMemberEntity?> getAllByMemberIdSync(
      List<String> memberIdValues) {
    final values = memberIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'memberId', values);
  }

  Future<int> deleteAllByMemberId(List<String> memberIdValues) {
    final values = memberIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'memberId', values);
  }

  int deleteAllByMemberIdSync(List<String> memberIdValues) {
    final values = memberIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'memberId', values);
  }

  Future<Id> putByMemberId(IsarChatRoomMemberEntity object) {
    return putByIndex(r'memberId', object);
  }

  Id putByMemberIdSync(IsarChatRoomMemberEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'memberId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMemberId(List<IsarChatRoomMemberEntity> objects) {
    return putAllByIndex(r'memberId', objects);
  }

  List<Id> putAllByMemberIdSync(List<IsarChatRoomMemberEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'memberId', objects, saveLinks: saveLinks);
  }
}

extension IsarChatRoomMemberEntityQueryWhereSort on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QWhere> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarChatRoomMemberEntityQueryWhere on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QWhereClause> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
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

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
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

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterWhereClause> memberIdEqualTo(String memberId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'memberId',
        value: [memberId],
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterWhereClause> memberIdNotEqualTo(String memberId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'memberId',
              lower: [],
              upper: [memberId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'memberId',
              lower: [memberId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'memberId',
              lower: [memberId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'memberId',
              lower: [],
              upper: [memberId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarChatRoomMemberEntityQueryFilter on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
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

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
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

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
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

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageRecordNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadMessageRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageRecordNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadMessageRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageRecordNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadMessageRecordNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageRecordNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadMessageRecordNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
          QAfterFilterCondition>
      memberIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
          QAfterFilterCondition>
      memberIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memberId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memberId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleEqualTo(
    ChatRoomMemberRole value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleGreaterThan(
    ChatRoomMemberRole value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleLessThan(
    ChatRoomMemberRole value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleBetween(
    ChatRoomMemberRole lower,
    ChatRoomMemberRole upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
          QAfterFilterCondition>
      roleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
          QAfterFilterCondition>
      roleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }
}

extension IsarChatRoomMemberEntityQueryObject on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QFilterCondition> {}

extension IsarChatRoomMemberEntityQueryLinks on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> rueJaiUser(FilterQuery<IsarRueJaiUserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'rueJaiUser');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> rueJaiUserIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'rueJaiUser', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }
}

extension IsarChatRoomMemberEntityQuerySortBy on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QSortBy> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByLastReadMessageRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByLastReadMessageRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }
}

extension IsarChatRoomMemberEntityQuerySortThenBy on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QSortThenBy> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByLastReadMessageRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageRecordNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByLastReadMessageRecordNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageRecordNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }
}

extension IsarChatRoomMemberEntityQueryWhereDistinct on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QDistinct> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QDistinct>
      distinctByLastReadMessageRecordNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadMessageRecordNumber');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QDistinct>
      distinctByMemberId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QDistinct>
      distinctByRole({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }
}

extension IsarChatRoomMemberEntityQueryProperty on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QQueryProperty> {
  QueryBuilder<IsarChatRoomMemberEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, int, QQueryOperations>
      lastReadMessageRecordNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadMessageRecordNumber');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, String, QQueryOperations>
      memberIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberId');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, ChatRoomMemberRole, QQueryOperations>
      roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }
}
