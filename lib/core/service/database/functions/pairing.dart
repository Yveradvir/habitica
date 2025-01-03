import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/controllers/habit_controller.dart';
import 'package:habitica/core/service/database/controllers/history_record_controller.dart';
import 'package:habitica/core/service/database/database.dart';

class PairedHabit {
  final HabitData habit;
  final HistoryRecordData? historyRecord;

  PairedHabit({required this.habit, this.historyRecord});

  @override
  String toString() {
    return "PairedHabit(habit: $habit, historyRecord: $historyRecord)";
  }
}

Future<List<PairedHabit>> getPairedHabits(
  AppDb db,
  DateTime date,
) async {
  final habits = await HabitController(db).getForDate(date);
  final historyRecords = await HistoryRecordController(db).getForDate(date);

  final historyMap = {
    for (var record in historyRecords) record.habitId: record
  };

  if (isDatesEqual(date, DateTime.now())) {
    for (var habit in habits) {
      if (!historyMap.containsKey(habit.id)) {
        final newRecord =
            await HistoryRecordController(db).createFromHabit(habit);
        historyMap[habit.id] = newRecord;
      }
    }
  }

  final pairedHabits = habits.map((habit) {
    final historyRecord = historyMap[habit.id];
    return PairedHabit(habit: habit, historyRecord: historyRecord);
  }).toList();

  return pairedHabits;
}

Future<PairedHabit> getPairedHabit(AppDb db, int recordId) {
  return HistoryRecordController(db).getById(recordId).then((record) {
    return HabitController(db).getById(record!.habitId).then((habit) {
      return PairedHabit(habit: habit!, historyRecord: record);
    });
  });
}
