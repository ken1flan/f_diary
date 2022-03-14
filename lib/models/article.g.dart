// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetArticleCollection on Isar {
  IsarCollection<Article> get articles {
    return getCollection('Article');
  }
}

final ArticleSchema = CollectionSchema(
  name: 'Article',
  schema:
      '{"name":"Article","idName":"id","properties":[{"name":"body","type":"String"},{"name":"createdAt","type":"Long"},{"name":"imageFile","type":"String"},{"name":"postedOn","type":"Long"},{"name":"title","type":"String"},{"name":"updatedAt","type":"Long"}],"indexes":[{"name":"postedOn","unique":false,"properties":[{"name":"postedOn","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _ArticleNativeAdapter(),
  webAdapter: const _ArticleWebAdapter(),
  idName: 'id',
  propertyIds: {
    'body': 0,
    'createdAt': 1,
    'imageFile': 2,
    'postedOn': 3,
    'title': 4,
    'updatedAt': 5
  },
  listProperties: {},
  indexIds: {'postedOn': 0},
  indexTypes: {
    'postedOn': [
      NativeIndexType.long,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

const _articleFileConverter = FileConverter();

class _ArticleWebAdapter extends IsarWebTypeAdapter<Article> {
  const _ArticleWebAdapter();

  @override
  Object serialize(IsarCollection<Article> collection, Article object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'body', object.body);
    IsarNative.jsObjectSet(
        jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(
        jsObj, 'imageFile', _articleFileConverter.toIsar(object.imageFile));
    IsarNative.jsObjectSet(
        jsObj, 'postedOn', object.postedOn.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'title', object.title);
    IsarNative.jsObjectSet(
        jsObj, 'updatedAt', object.updatedAt.toUtc().millisecondsSinceEpoch);
    return jsObj;
  }

  @override
  Article deserialize(IsarCollection<Article> collection, dynamic jsObj) {
    final object = Article();
    object.body = IsarNative.jsObjectGet(jsObj, 'body') ?? '';
    object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'createdAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.imageFile = _articleFileConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'imageFile'));
    object.postedOn = IsarNative.jsObjectGet(jsObj, 'postedOn') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'postedOn'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
    object.updatedAt = IsarNative.jsObjectGet(jsObj, 'updatedAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'updatedAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'body':
        return (IsarNative.jsObjectGet(jsObj, 'body') ?? '') as P;
      case 'createdAt':
        return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'createdAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'imageFile':
        return (_articleFileConverter
            .fromIsar(IsarNative.jsObjectGet(jsObj, 'imageFile'))) as P;
      case 'postedOn':
        return (IsarNative.jsObjectGet(jsObj, 'postedOn') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'postedOn'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'title':
        return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
      case 'updatedAt':
        return (IsarNative.jsObjectGet(jsObj, 'updatedAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'updatedAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Article object) {}
}

class _ArticleNativeAdapter extends IsarNativeTypeAdapter<Article> {
  const _ArticleNativeAdapter();

  @override
  void serialize(IsarCollection<Article> collection, IsarRawObject rawObj,
      Article object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.body;
    final _body = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_body.length) as int;
    final value1 = object.createdAt;
    final _createdAt = value1;
    final value2 = _articleFileConverter.toIsar(object.imageFile);
    IsarUint8List? _imageFile;
    if (value2 != null) {
      _imageFile = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_imageFile?.length ?? 0) as int;
    final value3 = object.postedOn;
    final _postedOn = value3;
    final value4 = object.title;
    final _title = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_title.length) as int;
    final value5 = object.updatedAt;
    final _updatedAt = value5;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _body);
    writer.writeDateTime(offsets[1], _createdAt);
    writer.writeBytes(offsets[2], _imageFile);
    writer.writeDateTime(offsets[3], _postedOn);
    writer.writeBytes(offsets[4], _title);
    writer.writeDateTime(offsets[5], _updatedAt);
  }

  @override
  Article deserialize(IsarCollection<Article> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Article();
    object.body = reader.readString(offsets[0]);
    object.createdAt = reader.readDateTime(offsets[1]);
    object.id = id;
    object.imageFile =
        _articleFileConverter.fromIsar(reader.readStringOrNull(offsets[2]));
    object.postedOn = reader.readDateTime(offsets[3]);
    object.title = reader.readString(offsets[4]);
    object.updatedAt = reader.readDateTime(offsets[5]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (_articleFileConverter.fromIsar(reader.readStringOrNull(offset)))
            as P;
      case 3:
        return (reader.readDateTime(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readDateTime(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Article object) {}
}

extension ArticleQueryWhereSort on QueryBuilder<Article, Article, QWhere> {
  QueryBuilder<Article, Article, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Article, Article, QAfterWhere> anyPostedOn() {
    return addWhereClauseInternal(const WhereClause(indexName: 'postedOn'));
  }
}

extension ArticleQueryWhere on QueryBuilder<Article, Article, QWhereClause> {
  QueryBuilder<Article, Article, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> postedOnEqualTo(
      DateTime postedOn) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'postedOn',
      lower: [postedOn],
      includeLower: true,
      upper: [postedOn],
      includeUpper: true,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> postedOnNotEqualTo(
      DateTime postedOn) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'postedOn',
        upper: [postedOn],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'postedOn',
        lower: [postedOn],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'postedOn',
        lower: [postedOn],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'postedOn',
        upper: [postedOn],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Article, Article, QAfterWhereClause> postedOnGreaterThan(
    DateTime postedOn, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'postedOn',
      lower: [postedOn],
      includeLower: include,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> postedOnLessThan(
    DateTime postedOn, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'postedOn',
      upper: [postedOn],
      includeUpper: include,
    ));
  }

  QueryBuilder<Article, Article, QAfterWhereClause> postedOnBetween(
    DateTime lowerPostedOn,
    DateTime upperPostedOn, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'postedOn',
      lower: [lowerPostedOn],
      includeLower: includeLower,
      upper: [upperPostedOn],
      includeUpper: includeUpper,
    ));
  }
}

extension ArticleQueryFilter
    on QueryBuilder<Article, Article, QFilterCondition> {
  QueryBuilder<Article, Article, QAfterFilterCondition> bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'body',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'body',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> bodyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'body',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'imageFile',
      value: null,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileEqualTo(
    File? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileGreaterThan(
    File? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileLessThan(
    File? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileBetween(
    File? lower,
    File? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'imageFile',
      lower: _articleFileConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _articleFileConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileStartsWith(
    File value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileEndsWith(
    File value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileContains(
      File value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imageFile',
      value: _articleFileConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> imageFileMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imageFile',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> postedOnEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'postedOn',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> postedOnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'postedOn',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> postedOnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'postedOn',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> postedOnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'postedOn',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<Article, Article, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updatedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ArticleQueryLinks
    on QueryBuilder<Article, Article, QFilterCondition> {}

extension ArticleQueryWhereSortBy on QueryBuilder<Article, Article, QSortBy> {
  QueryBuilder<Article, Article, QAfterSortBy> sortByBody() {
    return addSortByInternal('body', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByBodyDesc() {
    return addSortByInternal('body', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByImageFile() {
    return addSortByInternal('imageFile', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByImageFileDesc() {
    return addSortByInternal('imageFile', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByPostedOn() {
    return addSortByInternal('postedOn', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByPostedOnDesc() {
    return addSortByInternal('postedOn', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> sortByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
  }
}

extension ArticleQueryWhereSortThenBy
    on QueryBuilder<Article, Article, QSortThenBy> {
  QueryBuilder<Article, Article, QAfterSortBy> thenByBody() {
    return addSortByInternal('body', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByBodyDesc() {
    return addSortByInternal('body', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByImageFile() {
    return addSortByInternal('imageFile', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByImageFileDesc() {
    return addSortByInternal('imageFile', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByPostedOn() {
    return addSortByInternal('postedOn', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByPostedOnDesc() {
    return addSortByInternal('postedOn', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<Article, Article, QAfterSortBy> thenByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
  }
}

extension ArticleQueryWhereDistinct
    on QueryBuilder<Article, Article, QDistinct> {
  QueryBuilder<Article, Article, QDistinct> distinctByBody(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('body', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Article, Article, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Article, Article, QDistinct> distinctByImageFile(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('imageFile', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByPostedOn() {
    return addDistinctByInternal('postedOn');
  }

  QueryBuilder<Article, Article, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Article, Article, QDistinct> distinctByUpdatedAt() {
    return addDistinctByInternal('updatedAt');
  }
}

extension ArticleQueryProperty
    on QueryBuilder<Article, Article, QQueryProperty> {
  QueryBuilder<Article, String, QQueryOperations> bodyProperty() {
    return addPropertyNameInternal('body');
  }

  QueryBuilder<Article, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Article, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Article, File?, QQueryOperations> imageFileProperty() {
    return addPropertyNameInternal('imageFile');
  }

  QueryBuilder<Article, DateTime, QQueryOperations> postedOnProperty() {
    return addPropertyNameInternal('postedOn');
  }

  QueryBuilder<Article, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Article, DateTime, QQueryOperations> updatedAtProperty() {
    return addPropertyNameInternal('updatedAt');
  }
}
