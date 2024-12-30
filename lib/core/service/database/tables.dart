import 'package:drift/drift.dart';

class Habit extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 30)();
  IntColumn get color => integer()();
  // standart - count - timer
  TextColumn get type => text().withLength(min: 1, max: 10)();
  // Maximum seven days from the week. Only first three letters + maximum six comas.
  TextColumn get include => text().withLength(min: 3, max: (3 * 7) + 6)();
  DateTimeColumn get createdAt => dateTime().nullable()();

  IntColumn get count => integer().nullable()();
  IntColumn get duration => integer().nullable()();
}

class HistoryRecord extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer().references(Habit, #id)();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  DateTimeColumn get forDate => dateTime().nullable()();

  IntColumn get currentCount => integer().nullable()();
  IntColumn get currentDuration => integer().nullable()();
}
