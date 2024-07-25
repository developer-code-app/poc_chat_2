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
    r'lastReadMessageId': PropertySchema(
      id: 0,
      name: r'lastReadMessageId',
      type: IsarType.long,
    ),
    r'memberId': PropertySchema(
      id: 1,
      name: r'memberId',
      type: IsarType.long,
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
  indexes: {},
  links: {
    r'rueJaiUser': LinkSchema(
      id: -7145962735411436187,
      name: r'rueJaiUser',
      target: r'RueJaiUser',
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
  bytesCount += 3 + object.role.name.length * 3;
  return bytesCount;
}

void _isarChatRoomMemberEntitySerialize(
  IsarChatRoomMemberEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastReadMessageId);
  writer.writeLong(offsets[1], object.memberId);
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
  object.lastReadMessageId = reader.readLong(offsets[0]);
  object.memberId = reader.readLong(offsets[1]);
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
      return (reader.readLong(offset)) as P;
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
  return [object.rueJaiUser];
}

void _isarChatRoomMemberEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarChatRoomMemberEntity object) {
  object.id = id;
  object.rueJaiUser.attach(
      col, col.isar.collection<IsarRueJaiUserEntity>(), r'rueJaiUser', id);
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
      QAfterFilterCondition> lastReadMessageIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadMessageId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadMessageId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadMessageId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> lastReadMessageIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadMessageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity,
      QAfterFilterCondition> memberIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
}

extension IsarChatRoomMemberEntityQuerySortBy on QueryBuilder<
    IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QSortBy> {
  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByLastReadMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      sortByLastReadMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageId', Sort.desc);
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
      thenByLastReadMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageId', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QAfterSortBy>
      thenByLastReadMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadMessageId', Sort.desc);
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
      distinctByLastReadMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadMessageId');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, IsarChatRoomMemberEntity, QDistinct>
      distinctByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberId');
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
      lastReadMessageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadMessageId');
    });
  }

  QueryBuilder<IsarChatRoomMemberEntity, int, QQueryOperations>
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
