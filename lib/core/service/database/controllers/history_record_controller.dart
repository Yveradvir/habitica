import 'package:drift/drift.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/database.dart';

class HistoryRecordController {
  final AppDb db;

  const HistoryRecordController(this.db);

  Future<HistoryRecordData> create(Insertable<HistoryRecordData> entity) async {
    final insertedEntity =
        await db.into(db.historyRecord).insertReturning(entity);
    return insertedEntity;
  }

  Future<HistoryRecordData> createFromHabit(HabitData habit) async {
    final record = HistoryRecordCompanion(
      habitId: Value(habit.id),
      forDate: (Value(normalizedNow())),
      isDone: const Value(false),
      currentCount: habit.type == "count" ? const Value(0) : const Value(null),
      currentDuration:
          habit.type == "timer" ? const Value(0) : const Value(null),
    );

    return db.into(db.historyRecord).insertReturning(record);
  }

  Future<List<HistoryRecordData>> getAll() async {
    return await db.select(db.historyRecord).get();
  }

  Future<HistoryRecordData?> getById(int id) async {
    return await (db.select(db.historyRecord)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<HistoryRecordData>> getForDate(DateTime date) async {
    final query = db.select(db.historyRecord)
      ..where((t) => t.forDate.isValue(date));

    return await query.get();
  }
}