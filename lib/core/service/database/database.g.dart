// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitTable extends Habit with TableInfo<$HabitTable, HabitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _includeMeta =
      const VerificationMeta('include');
  @override
  late final GeneratedColumn<String> include =
      GeneratedColumn<String>('include', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 3,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, type, include, createdAt, count, duration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit';
  @override
  VerificationContext validateIntegrity(Insertable<HabitData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('include')) {
      context.handle(_includeMeta,
          include.isAcceptableOrUnknown(data['include']!, _includeMeta));
    } else if (isInserting) {
      context.missing(_includeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      include: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}include'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
    );
  }

  @override
  $HabitTable createAlias(String alias) {
    return $HabitTable(attachedDatabase, alias);
  }
}

class HabitData extends DataClass implements Insertable<HabitData> {
  final int id;
  final String name;
  final int color;
  final String type;
  final String include;
  final DateTime? createdAt;
  final int? count;
  final int? duration;
  const HabitData(
      {required this.id,
      required this.name,
      required this.color,
      required this.type,
      required this.include,
      this.createdAt,
      this.count,
      this.duration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    map['type'] = Variable<String>(type);
    map['include'] = Variable<String>(include);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<int>(count);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    return map;
  }

  HabitCompanion toCompanion(bool nullToAbsent) {
    return HabitCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      type: Value(type),
      include: Value(include),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      count:
          count == null && nullToAbsent ? const Value.absent() : Value(count),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
    );
  }

  factory HabitData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
      type: serializer.fromJson<String>(json['type']),
      include: serializer.fromJson<String>(json['include']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      count: serializer.fromJson<int?>(json['count']),
      duration: serializer.fromJson<int?>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
      'type': serializer.toJson<String>(type),
      'include': serializer.toJson<String>(include),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'count': serializer.toJson<int?>(count),
      'duration': serializer.toJson<int?>(duration),
    };
  }

  HabitData copyWith(
          {int? id,
          String? name,
          int? color,
          String? type,
          String? include,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<int?> count = const Value.absent(),
          Value<int?> duration = const Value.absent()}) =>
      HabitData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        type: type ?? this.type,
        include: include ?? this.include,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        count: count.present ? count.value : this.count,
        duration: duration.present ? duration.value : this.duration,
      );
  HabitData copyWithCompanion(HabitCompanion data) {
    return HabitData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      type: data.type.present ? data.type.value : this.type,
      include: data.include.present ? data.include.value : this.include,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      count: data.count.present ? data.count.value : this.count,
      duration: data.duration.present ? data.duration.value : this.duration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('type: $type, ')
          ..write('include: $include, ')
          ..write('createdAt: $createdAt, ')
          ..write('count: $count, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, type, include, createdAt, count, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.type == this.type &&
          other.include == this.include &&
          other.createdAt == this.createdAt &&
          other.count == this.count &&
          other.duration == this.duration);
}

class HabitCompanion extends UpdateCompanion<HabitData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  final Value<String> type;
  final Value<String> include;
  final Value<DateTime?> createdAt;
  final Value<int?> count;
  final Value<int?> duration;
  const HabitCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.type = const Value.absent(),
    this.include = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.count = const Value.absent(),
    this.duration = const Value.absent(),
  });
  HabitCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
    required String type,
    required String include,
    this.createdAt = const Value.absent(),
    this.count = const Value.absent(),
    this.duration = const Value.absent(),
  })  : name = Value(name),
        color = Value(color),
        type = Value(type),
        include = Value(include);
  static Insertable<HabitData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
    Expression<String>? type,
    Expression<String>? include,
    Expression<DateTime>? createdAt,
    Expression<int>? count,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (type != null) 'type': type,
      if (include != null) 'include': include,
      if (createdAt != null) 'created_at': createdAt,
      if (count != null) 'count': count,
      if (duration != null) 'duration': duration,
    });
  }

  HabitCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? color,
      Value<String>? type,
      Value<String>? include,
      Value<DateTime?>? createdAt,
      Value<int?>? count,
      Value<int?>? duration}) {
    return HabitCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      type: type ?? this.type,
      include: include ?? this.include,
      createdAt: createdAt ?? this.createdAt,
      count: count ?? this.count,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (include.present) {
      map['include'] = Variable<String>(include.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('type: $type, ')
          ..write('include: $include, ')
          ..write('createdAt: $createdAt, ')
          ..write('count: $count, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $HistoryRecordTable extends HistoryRecord
    with TableInfo<$HistoryRecordTable, HistoryRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryRecordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int> habitId = GeneratedColumn<int>(
      'habit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES habit (id)'));
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _forDateMeta =
      const VerificationMeta('forDate');
  @override
  late final GeneratedColumn<DateTime> forDate = GeneratedColumn<DateTime>(
      'for_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _currentCountMeta =
      const VerificationMeta('currentCount');
  @override
  late final GeneratedColumn<int> currentCount = GeneratedColumn<int>(
      'current_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currentDurationMeta =
      const VerificationMeta('currentDuration');
  @override
  late final GeneratedColumn<int> currentDuration = GeneratedColumn<int>(
      'current_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, habitId, isDone, forDate, currentCount, currentDuration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_record';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryRecordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    }
    if (data.containsKey('for_date')) {
      context.handle(_forDateMeta,
          forDate.isAcceptableOrUnknown(data['for_date']!, _forDateMeta));
    }
    if (data.containsKey('current_count')) {
      context.handle(
          _currentCountMeta,
          currentCount.isAcceptableOrUnknown(
              data['current_count']!, _currentCountMeta));
    }
    if (data.containsKey('current_duration')) {
      context.handle(
          _currentDurationMeta,
          currentDuration.isAcceptableOrUnknown(
              data['current_duration']!, _currentDurationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryRecordData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit_id'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      forDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}for_date']),
      currentCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_count']),
      currentDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_duration']),
    );
  }

  @override
  $HistoryRecordTable createAlias(String alias) {
    return $HistoryRecordTable(attachedDatabase, alias);
  }
}

class HistoryRecordData extends DataClass
    implements Insertable<HistoryRecordData> {
  final int id;
  final int habitId;
  final bool isDone;
  final DateTime? forDate;
  final int? currentCount;
  final int? currentDuration;
  const HistoryRecordData(
      {required this.id,
      required this.habitId,
      required this.isDone,
      this.forDate,
      this.currentCount,
      this.currentDuration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    map['is_done'] = Variable<bool>(isDone);
    if (!nullToAbsent || forDate != null) {
      map['for_date'] = Variable<DateTime>(forDate);
    }
    if (!nullToAbsent || currentCount != null) {
      map['current_count'] = Variable<int>(currentCount);
    }
    if (!nullToAbsent || currentDuration != null) {
      map['current_duration'] = Variable<int>(currentDuration);
    }
    return map;
  }

  HistoryRecordCompanion toCompanion(bool nullToAbsent) {
    return HistoryRecordCompanion(
      id: Value(id),
      habitId: Value(habitId),
      isDone: Value(isDone),
      forDate: forDate == null && nullToAbsent
          ? const Value.absent()
          : Value(forDate),
      currentCount: currentCount == null && nullToAbsent
          ? const Value.absent()
          : Value(currentCount),
      currentDuration: currentDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(currentDuration),
    );
  }

  factory HistoryRecordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryRecordData(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      forDate: serializer.fromJson<DateTime?>(json['forDate']),
      currentCount: serializer.fromJson<int?>(json['currentCount']),
      currentDuration: serializer.fromJson<int?>(json['currentDuration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'isDone': serializer.toJson<bool>(isDone),
      'forDate': serializer.toJson<DateTime?>(forDate),
      'currentCount': serializer.toJson<int?>(currentCount),
      'currentDuration': serializer.toJson<int?>(currentDuration),
    };
  }

  HistoryRecordData copyWith(
          {int? id,
          int? habitId,
          bool? isDone,
          Value<DateTime?> forDate = const Value.absent(),
          Value<int?> currentCount = const Value.absent(),
          Value<int?> currentDuration = const Value.absent()}) =>
      HistoryRecordData(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        isDone: isDone ?? this.isDone,
        forDate: forDate.present ? forDate.value : this.forDate,
        currentCount:
            currentCount.present ? currentCount.value : this.currentCount,
        currentDuration: currentDuration.present
            ? currentDuration.value
            : this.currentDuration,
      );
  HistoryRecordData copyWithCompanion(HistoryRecordCompanion data) {
    return HistoryRecordData(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      forDate: data.forDate.present ? data.forDate.value : this.forDate,
      currentCount: data.currentCount.present
          ? data.currentCount.value
          : this.currentCount,
      currentDuration: data.currentDuration.present
          ? data.currentDuration.value
          : this.currentDuration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryRecordData(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('isDone: $isDone, ')
          ..write('forDate: $forDate, ')
          ..write('currentCount: $currentCount, ')
          ..write('currentDuration: $currentDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitId, isDone, forDate, currentCount, currentDuration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryRecordData &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.isDone == this.isDone &&
          other.forDate == this.forDate &&
          other.currentCount == this.currentCount &&
          other.currentDuration == this.currentDuration);
}

class HistoryRecordCompanion extends UpdateCompanion<HistoryRecordData> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<bool> isDone;
  final Value<DateTime?> forDate;
  final Value<int?> currentCount;
  final Value<int?> currentDuration;
  const HistoryRecordCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.isDone = const Value.absent(),
    this.forDate = const Value.absent(),
    this.currentCount = const Value.absent(),
    this.currentDuration = const Value.absent(),
  });
  HistoryRecordCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    this.isDone = const Value.absent(),
    this.forDate = const Value.absent(),
    this.currentCount = const Value.absent(),
    this.currentDuration = const Value.absent(),
  }) : habitId = Value(habitId);
  static Insertable<HistoryRecordData> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<bool>? isDone,
    Expression<DateTime>? forDate,
    Expression<int>? currentCount,
    Expression<int>? currentDuration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (isDone != null) 'is_done': isDone,
      if (forDate != null) 'for_date': forDate,
      if (currentCount != null) 'current_count': currentCount,
      if (currentDuration != null) 'current_duration': currentDuration,
    });
  }

  HistoryRecordCompanion copyWith(
      {Value<int>? id,
      Value<int>? habitId,
      Value<bool>? isDone,
      Value<DateTime?>? forDate,
      Value<int?>? currentCount,
      Value<int?>? currentDuration}) {
    return HistoryRecordCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      isDone: isDone ?? this.isDone,
      forDate: forDate ?? this.forDate,
      currentCount: currentCount ?? this.currentCount,
      currentDuration: currentDuration ?? this.currentDuration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<DateTime>(forDate.value);
    }
    if (currentCount.present) {
      map['current_count'] = Variable<int>(currentCount.value);
    }
    if (currentDuration.present) {
      map['current_duration'] = Variable<int>(currentDuration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryRecordCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('isDone: $isDone, ')
          ..write('forDate: $forDate, ')
          ..write('currentCount: $currentCount, ')
          ..write('currentDuration: $currentDuration')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $HabitTable habit = $HabitTable(this);
  late final $HistoryRecordTable historyRecord = $HistoryRecordTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [habit, historyRecord];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$HabitTableCreateCompanionBuilder = HabitCompanion Function({
  Value<int> id,
  required String name,
  required int color,
  required String type,
  required String include,
  Value<DateTime?> createdAt,
  Value<int?> count,
  Value<int?> duration,
});
typedef $$HabitTableUpdateCompanionBuilder = HabitCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> color,
  Value<String> type,
  Value<String> include,
  Value<DateTime?> createdAt,
  Value<int?> count,
  Value<int?> duration,
});

final class $$HabitTableReferences
    extends BaseReferences<_$AppDb, $HabitTable, HabitData> {
  $$HabitTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HistoryRecordTable, List<HistoryRecordData>>
      _historyRecordRefsTable(_$AppDb db) =>
          MultiTypedResultKey.fromTable(db.historyRecord,
              aliasName:
                  $_aliasNameGenerator(db.habit.id, db.historyRecord.habitId));

  $$HistoryRecordTableProcessedTableManager get historyRecordRefs {
    final manager = $$HistoryRecordTableTableManager($_db, $_db.historyRecord)
        .filter((f) => f.habitId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_historyRecordRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HabitTableFilterComposer extends Composer<_$AppDb, $HabitTable> {
  $$HabitTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get include => $composableBuilder(
      column: $table.include, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  Expression<bool> historyRecordRefs(
      Expression<bool> Function($$HistoryRecordTableFilterComposer f) f) {
    final $$HistoryRecordTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyRecord,
        getReferencedColumn: (t) => t.habitId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryRecordTableFilterComposer(
              $db: $db,
              $table: $db.historyRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HabitTableOrderingComposer extends Composer<_$AppDb, $HabitTable> {
  $$HabitTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get include => $composableBuilder(
      column: $table.include, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));
}

class $$HabitTableAnnotationComposer extends Composer<_$AppDb, $HabitTable> {
  $$HabitTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get include =>
      $composableBuilder(column: $table.include, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  Expression<T> historyRecordRefs<T extends Object>(
      Expression<T> Function($$HistoryRecordTableAnnotationComposer a) f) {
    final $$HistoryRecordTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyRecord,
        getReferencedColumn: (t) => t.habitId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryRecordTableAnnotationComposer(
              $db: $db,
              $table: $db.historyRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HabitTableTableManager extends RootTableManager<
    _$AppDb,
    $HabitTable,
    HabitData,
    $$HabitTableFilterComposer,
    $$HabitTableOrderingComposer,
    $$HabitTableAnnotationComposer,
    $$HabitTableCreateCompanionBuilder,
    $$HabitTableUpdateCompanionBuilder,
    (HabitData, $$HabitTableReferences),
    HabitData,
    PrefetchHooks Function({bool historyRecordRefs})> {
  $$HabitTableTableManager(_$AppDb db, $HabitTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> include = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int?> count = const Value.absent(),
            Value<int?> duration = const Value.absent(),
          }) =>
              HabitCompanion(
            id: id,
            name: name,
            color: color,
            type: type,
            include: include,
            createdAt: createdAt,
            count: count,
            duration: duration,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int color,
            required String type,
            required String include,
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int?> count = const Value.absent(),
            Value<int?> duration = const Value.absent(),
          }) =>
              HabitCompanion.insert(
            id: id,
            name: name,
            color: color,
            type: type,
            include: include,
            createdAt: createdAt,
            count: count,
            duration: duration,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HabitTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({historyRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (historyRecordRefs) db.historyRecord
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (historyRecordRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$HabitTableReferences._historyRecordRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HabitTableReferences(db, table, p0)
                                .historyRecordRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.habitId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HabitTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $HabitTable,
    HabitData,
    $$HabitTableFilterComposer,
    $$HabitTableOrderingComposer,
    $$HabitTableAnnotationComposer,
    $$HabitTableCreateCompanionBuilder,
    $$HabitTableUpdateCompanionBuilder,
    (HabitData, $$HabitTableReferences),
    HabitData,
    PrefetchHooks Function({bool historyRecordRefs})>;
typedef $$HistoryRecordTableCreateCompanionBuilder = HistoryRecordCompanion
    Function({
  Value<int> id,
  required int habitId,
  Value<bool> isDone,
  Value<DateTime?> forDate,
  Value<int?> currentCount,
  Value<int?> currentDuration,
});
typedef $$HistoryRecordTableUpdateCompanionBuilder = HistoryRecordCompanion
    Function({
  Value<int> id,
  Value<int> habitId,
  Value<bool> isDone,
  Value<DateTime?> forDate,
  Value<int?> currentCount,
  Value<int?> currentDuration,
});

final class $$HistoryRecordTableReferences
    extends BaseReferences<_$AppDb, $HistoryRecordTable, HistoryRecordData> {
  $$HistoryRecordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $HabitTable _habitIdTable(_$AppDb db) => db.habit
      .createAlias($_aliasNameGenerator(db.historyRecord.habitId, db.habit.id));

  $$HabitTableProcessedTableManager get habitId {
    final manager = $$HabitTableTableManager($_db, $_db.habit)
        .filter((f) => f.id($_item.habitId));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HistoryRecordTableFilterComposer
    extends Composer<_$AppDb, $HistoryRecordTable> {
  $$HistoryRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDone => $composableBuilder(
      column: $table.isDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get forDate => $composableBuilder(
      column: $table.forDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentCount => $composableBuilder(
      column: $table.currentCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentDuration => $composableBuilder(
      column: $table.currentDuration,
      builder: (column) => ColumnFilters(column));

  $$HabitTableFilterComposer get habitId {
    final $$HabitTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habit,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitTableFilterComposer(
              $db: $db,
              $table: $db.habit,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryRecordTableOrderingComposer
    extends Composer<_$AppDb, $HistoryRecordTable> {
  $$HistoryRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDone => $composableBuilder(
      column: $table.isDone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get forDate => $composableBuilder(
      column: $table.forDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentCount => $composableBuilder(
      column: $table.currentCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentDuration => $composableBuilder(
      column: $table.currentDuration,
      builder: (column) => ColumnOrderings(column));

  $$HabitTableOrderingComposer get habitId {
    final $$HabitTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habit,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitTableOrderingComposer(
              $db: $db,
              $table: $db.habit,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryRecordTableAnnotationComposer
    extends Composer<_$AppDb, $HistoryRecordTable> {
  $$HistoryRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get forDate =>
      $composableBuilder(column: $table.forDate, builder: (column) => column);

  GeneratedColumn<int> get currentCount => $composableBuilder(
      column: $table.currentCount, builder: (column) => column);

  GeneratedColumn<int> get currentDuration => $composableBuilder(
      column: $table.currentDuration, builder: (column) => column);

  $$HabitTableAnnotationComposer get habitId {
    final $$HabitTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habit,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitTableAnnotationComposer(
              $db: $db,
              $table: $db.habit,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryRecordTableTableManager extends RootTableManager<
    _$AppDb,
    $HistoryRecordTable,
    HistoryRecordData,
    $$HistoryRecordTableFilterComposer,
    $$HistoryRecordTableOrderingComposer,
    $$HistoryRecordTableAnnotationComposer,
    $$HistoryRecordTableCreateCompanionBuilder,
    $$HistoryRecordTableUpdateCompanionBuilder,
    (HistoryRecordData, $$HistoryRecordTableReferences),
    HistoryRecordData,
    PrefetchHooks Function({bool habitId})> {
  $$HistoryRecordTableTableManager(_$AppDb db, $HistoryRecordTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> habitId = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
            Value<DateTime?> forDate = const Value.absent(),
            Value<int?> currentCount = const Value.absent(),
            Value<int?> currentDuration = const Value.absent(),
          }) =>
              HistoryRecordCompanion(
            id: id,
            habitId: habitId,
            isDone: isDone,
            forDate: forDate,
            currentCount: currentCount,
            currentDuration: currentDuration,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int habitId,
            Value<bool> isDone = const Value.absent(),
            Value<DateTime?> forDate = const Value.absent(),
            Value<int?> currentCount = const Value.absent(),
            Value<int?> currentDuration = const Value.absent(),
          }) =>
              HistoryRecordCompanion.insert(
            id: id,
            habitId: habitId,
            isDone: isDone,
            forDate: forDate,
            currentCount: currentCount,
            currentDuration: currentDuration,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HistoryRecordTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (habitId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.habitId,
                    referencedTable:
                        $$HistoryRecordTableReferences._habitIdTable(db),
                    referencedColumn:
                        $$HistoryRecordTableReferences._habitIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HistoryRecordTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $HistoryRecordTable,
    HistoryRecordData,
    $$HistoryRecordTableFilterComposer,
    $$HistoryRecordTableOrderingComposer,
    $$HistoryRecordTableAnnotationComposer,
    $$HistoryRecordTableCreateCompanionBuilder,
    $$HistoryRecordTableUpdateCompanionBuilder,
    (HistoryRecordData, $$HistoryRecordTableReferences),
    HistoryRecordData,
    PrefetchHooks Function({bool habitId})>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$HabitTableTableManager get habit =>
      $$HabitTableTableManager(_db, _db.habit);
  $$HistoryRecordTableTableManager get historyRecord =>
      $$HistoryRecordTableTableManager(_db, _db.historyRecord);
}
