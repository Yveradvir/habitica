import 'package:flutter/material.dart';
import 'package:habitica/core/service/database/controllers/history_record_controller.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/pages/single_habit/bloc/single_habit_bloc.dart';
import 'package:provider/provider.dart';

class TypedCard extends StatelessWidget {
  final HistoryRecordData record;
  final HabitData habit;

  const TypedCard({super.key, required this.habit, required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [if (habit.type == 'standart') ...getStandart(context)],
        ),
      ),
    );
  }

  List<Widget> getStandart(BuildContext context) {
    final theme = Theme.of(context);

    return [
      GestureDetector(
        onTap: () {
          final db = Provider.of<AppDb>(context, listen: false);
          HistoryRecordController(db).updateDynamic(
              existingRecord: record, habit: habit, isDone: !record.isDone);
          context
              .read<SingleHabitBloc>()
              .add(LoadSingleHabit(db: db, id: record.id));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(habit.color),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'Mark as ${record.isDone ? 'Not Done' : 'Done'}',
              style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 34, color: theme.scaffoldBackgroundColor),
            ),
          ),
        ),
      )
    ];
  }
}
