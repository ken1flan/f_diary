// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3835903601800013556),
      name: 'Article',
      lastPropertyId: const IdUid(7, 2701099158427801709),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4363551786039702549),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2180324453382744783),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5312914715229980906),
            name: 'body',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7456617027887910271),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2701099158427801709),
            name: 'updatedAt',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 3835903601800013556),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [597230347195710846, 7964077721326186546],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Article: EntityDefinition<Article>(
        model: _entities[0],
        toOneRelations: (Article object) => [],
        toManyRelations: (Article object) => {},
        getId: (Article object) => object.id,
        setId: (Article object, int id) {
          object.id = id;
        },
        objectToFB: (Article object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final bodyOffset =
              object.body == null ? null : fbb.writeString(object.body!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, bodyOffset);
          fbb.addInt64(5, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(6, object.updatedAt?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final updatedAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final object = Article()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..title =
                const fb.StringReader().vTableGetNullable(buffer, rootOffset, 6)
            ..body =
                const fb.StringReader().vTableGetNullable(buffer, rootOffset, 8)
            ..createdAt = createdAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(createdAtValue)
            ..updatedAt = updatedAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(updatedAtValue);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Article] entity fields to define ObjectBox queries.
class Article_ {
  /// see [Article.id]
  static final id = QueryIntegerProperty<Article>(_entities[0].properties[0]);

  /// see [Article.title]
  static final title = QueryStringProperty<Article>(_entities[0].properties[1]);

  /// see [Article.body]
  static final body = QueryStringProperty<Article>(_entities[0].properties[2]);

  /// see [Article.createdAt]
  static final createdAt =
      QueryIntegerProperty<Article>(_entities[0].properties[3]);

  /// see [Article.updatedAt]
  static final updatedAt =
      QueryIntegerProperty<Article>(_entities[0].properties[4]);
}