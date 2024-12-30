// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_field

part of 'database.dart';

// ignore_for_file: type=lint
abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
}
