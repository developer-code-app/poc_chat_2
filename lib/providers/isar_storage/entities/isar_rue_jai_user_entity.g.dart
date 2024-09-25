// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_rue_jai_user_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarRueJaiUserEntityCollection on Isar {
  IsarCollection<IsarRueJaiUserEntity> get isarRueJaiUserEntitys =>
      this.collection();
}

const IsarRueJaiUserEntitySchema = CollectionSchema(
  name: r'RueJaiUser',
  id: -6226032412652577243,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 1,
      name: r'role',
      type: IsarType.string,
      enumMap: _IsarRueJaiUserEntityroleEnumValueMap,
    ),
    r'rueJaiUserId': PropertySchema(
      id: 2,
      name: r'rueJaiUserId',
      type: IsarType.string,
    ),
    r'thumbnailUrl': PropertySchema(
      id: 3,
      name: r'thumbnailUrl',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _IsarRueJaiUserEntitytypeEnumValueMap,
    )
  },
  estimateSize: _isarRueJaiUserEntityEstimateSize,
  serialize: _isarRueJaiUserEntitySerialize,
  deserialize: _isarRueJaiUserEntityDeserialize,
  deserializeProp: _isarRueJaiUserEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'rueJaiUserId_type': IndexSchema(
      id: 2305547233811128353,
      name: r'rueJaiUserId_type',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'rueJaiUserId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'member': LinkSchema(
      id: 4558710930490059963,
      name: r'member',
      target: r'ChatRoomMember',
      single: false,
      linkName: r'rueJaiUser',
    )
  },
  embeddedSchemas: {},
  getId: _isarRueJaiUserEntityGetId,
  getLinks: _isarRueJaiUserEntityGetLinks,
  attach: _isarRueJaiUserEntityAttach,
  version: '3.1.0+1',
);

int _isarRueJaiUserEntityEstimateSize(
  IsarRueJaiUserEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.role.name.length * 3;
  bytesCount += 3 + object.rueJaiUserId.length * 3;
  {
    final value = object.thumbnailUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _isarRueJaiUserEntitySerialize(
  IsarRueJaiUserEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.role.name);
  writer.writeString(offsets[2], object.rueJaiUserId);
  writer.writeString(offsets[3], object.thumbnailUrl);
  writer.writeString(offsets[4], object.type.name);
}

IsarRueJaiUserEntity _isarRueJaiUserEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarRueJaiUserEntity();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.role = _IsarRueJaiUserEntityroleValueEnumMap[
          reader.readStringOrNull(offsets[1])] ??
      RueJaiUserRole.homeOwner;
  object.rueJaiUserId = reader.readString(offsets[2]);
  object.thumbnailUrl = reader.readStringOrNull(offsets[3]);
  object.type = _IsarRueJaiUserEntitytypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      RueJaiUserType.rueJaiAdmin;
  return object;
}

P _isarRueJaiUserEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_IsarRueJaiUserEntityroleValueEnumMap[
              reader.readStringOrNull(offset)] ??
          RueJaiUserRole.homeOwner) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_IsarRueJaiUserEntitytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          RueJaiUserType.rueJaiAdmin) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarRueJaiUserEntityroleEnumValueMap = {
  r'homeOwner': r'homeOwner',
  r'resident': r'resident',
  r'renter': r'renter',
  r'customerService': r'customerService',
};
const _IsarRueJaiUserEntityroleValueEnumMap = {
  r'homeOwner': RueJaiUserRole.homeOwner,
  r'resident': RueJaiUserRole.resident,
  r'renter': RueJaiUserRole.renter,
  r'customerService': RueJaiUserRole.customerService,
};
const _IsarRueJaiUserEntitytypeEnumValueMap = {
  r'rueJaiAdmin': r'rueJaiAdmin',
  r'rueJaiAppUser': r'rueJaiAppUser',
};
const _IsarRueJaiUserEntitytypeValueEnumMap = {
  r'rueJaiAdmin': RueJaiUserType.rueJaiAdmin,
  r'rueJaiAppUser': RueJaiUserType.rueJaiAppUser,
};

Id _isarRueJaiUserEntityGetId(IsarRueJaiUserEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarRueJaiUserEntityGetLinks(
    IsarRueJaiUserEntity object) {
  return [object.member];
}

void _isarRueJaiUserEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarRueJaiUserEntity object) {
  object.id = id;
  object.member.attach(
      col, col.isar.collection<IsarChatRoomMemberEntity>(), r'member', id);
}

extension IsarRueJaiUserEntityByIndex on IsarCollection<IsarRueJaiUserEntity> {
  Future<IsarRueJaiUserEntity?> getByRueJaiUserIdType(
      String rueJaiUserId, RueJaiUserType type) {
    return getByIndex(r'rueJaiUserId_type', [rueJaiUserId, type]);
  }

  IsarRueJaiUserEntity? getByRueJaiUserIdTypeSync(
      String rueJaiUserId, RueJaiUserType type) {
    return getByIndexSync(r'rueJaiUserId_type', [rueJaiUserId, type]);
  }

  Future<bool> deleteByRueJaiUserIdType(
      String rueJaiUserId, RueJaiUserType type) {
    return deleteByIndex(r'rueJaiUserId_type', [rueJaiUserId, type]);
  }

  bool deleteByRueJaiUserIdTypeSync(String rueJaiUserId, RueJaiUserType type) {
    return deleteByIndexSync(r'rueJaiUserId_type', [rueJaiUserId, type]);
  }

  Future<List<IsarRueJaiUserEntity?>> getAllByRueJaiUserIdType(
      List<String> rueJaiUserIdValues, List<RueJaiUserType> typeValues) {
    final len = rueJaiUserIdValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rueJaiUserIdValues[i], typeValues[i]]);
    }

    return getAllByIndex(r'rueJaiUserId_type', values);
  }

  List<IsarRueJaiUserEntity?> getAllByRueJaiUserIdTypeSync(
      List<String> rueJaiUserIdValues, List<RueJaiUserType> typeValues) {
    final len = rueJaiUserIdValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rueJaiUserIdValues[i], typeValues[i]]);
    }

    return getAllByIndexSync(r'rueJaiUserId_type', values);
  }

  Future<int> deleteAllByRueJaiUserIdType(
      List<String> rueJaiUserIdValues, List<RueJaiUserType> typeValues) {
    final len = rueJaiUserIdValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rueJaiUserIdValues[i], typeValues[i]]);
    }

    return deleteAllByIndex(r'rueJaiUserId_type', values);
  }

  int deleteAllByRueJaiUserIdTypeSync(
      List<String> rueJaiUserIdValues, List<RueJaiUserType> typeValues) {
    final len = rueJaiUserIdValues.length;
    assert(
        typeValues.length == len, 'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([rueJaiUserIdValues[i], typeValues[i]]);
    }

    return deleteAllByIndexSync(r'rueJaiUserId_type', values);
  }

  Future<Id> putByRueJaiUserIdType(IsarRueJaiUserEntity object) {
    return putByIndex(r'rueJaiUserId_type', object);
  }

  Id putByRueJaiUserIdTypeSync(IsarRueJaiUserEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'rueJaiUserId_type', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRueJaiUserIdType(
      List<IsarRueJaiUserEntity> objects) {
    return putAllByIndex(r'rueJaiUserId_type', objects);
  }

  List<Id> putAllByRueJaiUserIdTypeSync(List<IsarRueJaiUserEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'rueJaiUserId_type', objects,
        saveLinks: saveLinks);
  }
}

extension IsarRueJaiUserEntityQueryWhereSort
    on QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QWhere> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarRueJaiUserEntityQueryWhere
    on QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QWhereClause> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      rueJaiUserIdEqualToAnyType(String rueJaiUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rueJaiUserId_type',
        value: [rueJaiUserId],
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      rueJaiUserIdNotEqualToAnyType(String rueJaiUserId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [],
              upper: [rueJaiUserId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [],
              upper: [rueJaiUserId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      rueJaiUserIdTypeEqualTo(String rueJaiUserId, RueJaiUserType type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rueJaiUserId_type',
        value: [rueJaiUserId, type],
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterWhereClause>
      rueJaiUserIdEqualToTypeNotEqualTo(
          String rueJaiUserId, RueJaiUserType type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId],
              upper: [rueJaiUserId, type],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId, type],
              includeLower: false,
              upper: [rueJaiUserId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId, type],
              includeLower: false,
              upper: [rueJaiUserId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rueJaiUserId_type',
              lower: [rueJaiUserId],
              upper: [rueJaiUserId, type],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarRueJaiUserEntityQueryFilter on QueryBuilder<IsarRueJaiUserEntity,
    IsarRueJaiUserEntity, QFilterCondition> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleEqualTo(
    RueJaiUserRole value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleGreaterThan(
    RueJaiUserRole value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleLessThan(
    RueJaiUserRole value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleBetween(
    RueJaiUserRole lower,
    RueJaiUserRole upper, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rueJaiUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      rueJaiUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rueJaiUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      rueJaiUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rueJaiUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rueJaiUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> rueJaiUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rueJaiUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnailUrl',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnailUrl',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlEqualTo(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlGreaterThan(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlLessThan(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlBetween(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlStartsWith(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlEndsWith(
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      thumbnailUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
          QAfterFilterCondition>
      thumbnailUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> thumbnailUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeEqualTo(
    RueJaiUserType value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeGreaterThan(
    RueJaiUserType value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeLessThan(
    RueJaiUserType value, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeBetween(
    RueJaiUserType lower,
    RueJaiUserType upper, {
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
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

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension IsarRueJaiUserEntityQueryObject on QueryBuilder<IsarRueJaiUserEntity,
    IsarRueJaiUserEntity, QFilterCondition> {}

extension IsarRueJaiUserEntityQueryLinks on QueryBuilder<IsarRueJaiUserEntity,
    IsarRueJaiUserEntity, QFilterCondition> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> member(FilterQuery<IsarChatRoomMemberEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'member');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', length, true, length, true);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, true, length, include);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity,
      QAfterFilterCondition> memberLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'member', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarRueJaiUserEntityQuerySortBy
    on QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QSortBy> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByRueJaiUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rueJaiUserId', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByRueJaiUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rueJaiUserId', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarRueJaiUserEntityQuerySortThenBy
    on QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QSortThenBy> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByRueJaiUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rueJaiUserId', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByRueJaiUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rueJaiUserId', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarRueJaiUserEntityQueryWhereDistinct
    on QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct> {
  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct>
      distinctByRole({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct>
      distinctByRueJaiUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rueJaiUserId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct>
      distinctByThumbnailUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, IsarRueJaiUserEntity, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension IsarRueJaiUserEntityQueryProperty on QueryBuilder<
    IsarRueJaiUserEntity, IsarRueJaiUserEntity, QQueryProperty> {
  QueryBuilder<IsarRueJaiUserEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, RueJaiUserRole, QQueryOperations>
      roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, String, QQueryOperations>
      rueJaiUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rueJaiUserId');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, String?, QQueryOperations>
      thumbnailUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailUrl');
    });
  }

  QueryBuilder<IsarRueJaiUserEntity, RueJaiUserType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
