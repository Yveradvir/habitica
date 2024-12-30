import 'package:habitica/core/service/database/database.dart';

class PairedHabit {
  final HabitData habit;
  final HistoryRecordData? historyRecord;

  PairedHabit({required this.habit, this.historyRecord});
}
