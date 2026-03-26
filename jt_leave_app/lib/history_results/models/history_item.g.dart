// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistoryItemCollection on Isar {
  IsarCollection<HistoryItem> get historyItems => this.collection();
}

const HistoryItemSchema = CollectionSchema(
  name: r'HistoryItem',
  id: -4222060418120810312,
  properties: {
    r'fromDate': PropertySchema(
      id: 0,
      name: r'fromDate',
      type: IsarType.dateTime,
    ),
    r'leaveCode': PropertySchema(
      id: 1,
      name: r'leaveCode',
      type: IsarType.long,
    ),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
    r'numOfDays': PropertySchema(
      id: 3,
      name: r'numOfDays',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.byte,
      enumMap: _HistoryItemstatusEnumValueMap,
    ),
    r'submittedDate': PropertySchema(
      id: 5,
      name: r'submittedDate',
      type: IsarType.dateTime,
    ),
    r'toDate': PropertySchema(id: 6, name: r'toDate', type: IsarType.dateTime),
  },

  estimateSize: _historyItemEstimateSize,
  serialize: _historyItemSerialize,
  deserialize: _historyItemDeserialize,
  deserializeProp: _historyItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _historyItemGetId,
  getLinks: _historyItemGetLinks,
  attach: _historyItemAttach,
  version: '3.3.0',
);

int _historyItemEstimateSize(
  HistoryItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _historyItemSerialize(
  HistoryItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fromDate);
  writer.writeLong(offsets[1], object.leaveCode);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.numOfDays);
  writer.writeByte(offsets[4], object.status.index);
  writer.writeDateTime(offsets[5], object.submittedDate);
  writer.writeDateTime(offsets[6], object.toDate);
}

HistoryItem _historyItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistoryItem(
    fromDate: reader.readDateTime(offsets[0]),
    leaveCode: reader.readLong(offsets[1]),
    name: reader.readString(offsets[2]),
    numOfDays: reader.readLong(offsets[3]),
    status:
        _HistoryItemstatusValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        SubmitStatus.pending,
    submittedDate: reader.readDateTime(offsets[5]),
    toDate: reader.readDateTime(offsets[6]),
  );
  object.id = id;
  return object;
}

P _historyItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_HistoryItemstatusValueEnumMap[reader.readByteOrNull(offset)] ??
              SubmitStatus.pending)
          as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HistoryItemstatusEnumValueMap = {'pending': 0, 'done': 1};
const _HistoryItemstatusValueEnumMap = {
  0: SubmitStatus.pending,
  1: SubmitStatus.approved,
};

Id _historyItemGetId(HistoryItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _historyItemGetLinks(HistoryItem object) {
  return [];
}

void _historyItemAttach(
  IsarCollection<dynamic> col,
  Id id,
  HistoryItem object,
) {
  object.id = id;
}

extension HistoryItemQueryWhereSort
    on QueryBuilder<HistoryItem, HistoryItem, QWhere> {
  QueryBuilder<HistoryItem, HistoryItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HistoryItemQueryWhere
    on QueryBuilder<HistoryItem, HistoryItem, QWhereClause> {
  QueryBuilder<HistoryItem, HistoryItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<HistoryItem, HistoryItem, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HistoryItemQueryFilter
    on QueryBuilder<HistoryItem, HistoryItem, QFilterCondition> {
  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> fromDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fromDate', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  fromDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fromDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  fromDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fromDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> fromDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fromDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  leaveCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'leaveCode', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  leaveCodeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'leaveCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  leaveCodeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'leaveCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  leaveCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'leaveCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  numOfDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'numOfDays', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  numOfDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'numOfDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  numOfDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'numOfDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  numOfDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'numOfDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> statusEqualTo(
    SubmitStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  statusGreaterThan(SubmitStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> statusLessThan(
    SubmitStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> statusBetween(
    SubmitStatus lower,
    SubmitStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  submittedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'submittedDate', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  submittedDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'submittedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  submittedDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'submittedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  submittedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'submittedDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> toDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'toDate', value: value),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition>
  toDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'toDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> toDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'toDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterFilterCondition> toDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'toDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HistoryItemQueryObject
    on QueryBuilder<HistoryItem, HistoryItem, QFilterCondition> {}

extension HistoryItemQueryLinks
    on QueryBuilder<HistoryItem, HistoryItem, QFilterCondition> {}

extension HistoryItemQuerySortBy
    on QueryBuilder<HistoryItem, HistoryItem, QSortBy> {
  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByFromDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByFromDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromDate', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByLeaveCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveCode', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByLeaveCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveCode', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByNumOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfDays', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByNumOfDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfDays', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortBySubmittedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy>
  sortBySubmittedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedDate', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByToDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> sortByToDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDate', Sort.desc);
    });
  }
}

extension HistoryItemQuerySortThenBy
    on QueryBuilder<HistoryItem, HistoryItem, QSortThenBy> {
  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByFromDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByFromDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromDate', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByLeaveCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveCode', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByLeaveCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaveCode', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByNumOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfDays', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByNumOfDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfDays', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenBySubmittedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy>
  thenBySubmittedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedDate', Sort.desc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByToDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDate', Sort.asc);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QAfterSortBy> thenByToDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDate', Sort.desc);
    });
  }
}

extension HistoryItemQueryWhereDistinct
    on QueryBuilder<HistoryItem, HistoryItem, QDistinct> {
  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByFromDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromDate');
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByLeaveCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaveCode');
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByNumOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numOfDays');
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctBySubmittedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedDate');
    });
  }

  QueryBuilder<HistoryItem, HistoryItem, QDistinct> distinctByToDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toDate');
    });
  }
}

extension HistoryItemQueryProperty
    on QueryBuilder<HistoryItem, HistoryItem, QQueryProperty> {
  QueryBuilder<HistoryItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HistoryItem, DateTime, QQueryOperations> fromDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromDate');
    });
  }

  QueryBuilder<HistoryItem, int, QQueryOperations> leaveCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaveCode');
    });
  }

  QueryBuilder<HistoryItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<HistoryItem, int, QQueryOperations> numOfDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numOfDays');
    });
  }

  QueryBuilder<HistoryItem, SubmitStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<HistoryItem, DateTime, QQueryOperations>
  submittedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedDate');
    });
  }

  QueryBuilder<HistoryItem, DateTime, QQueryOperations> toDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toDate');
    });
  }
}
