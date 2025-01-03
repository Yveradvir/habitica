import 'package:flutter/material.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/service/database/functions/pairing.dart';
import 'package:habitica/core/service/navigation/cubit.dart';
import 'package:habitica/pages/single_habit/bloc/single_habit_bloc.dart';
import 'package:provider/provider.dart';

class HabitCard extends StatelessWidget {
  final PairedHabit pairedHabit;

  const HabitCard({super.key, required this.pairedHabit});

  String formatSecondsToString(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  String getText() {
    String text =
        pairedHabit.historyRecord?.isDone == true ? 'Done' : 'Not Done';
    if (pairedHabit.habit.type == "count") {
      text +=
          " | ${pairedHabit.historyRecord?.currentCount ?? 0}/${pairedHabit.habit.count}";
    } else if (pairedHabit.habit.type == "timer") {
      text +=
          " | ${formatSecondsToString(pairedHabit.historyRecord?.currentDuration ?? 0)}/${formatSecondsToString(pairedHabit.habit.duration ?? 60)}";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (normalizedNow() != pairedHabit.historyRecord?.forDate) {
                  return;
                }
                var db = Provider.of<AppDb>(context, listen: false);
                final id = pairedHabit.historyRecord?.id ?? 0;

                context.read<NavigationCubit>().goToSingleHabit();
                context
                    .read<SingleHabitBloc>()
                    .add(LoadSingleHabit(db: db, id: id));
              },
              child: Container(
                width: 54,
                height: 54,
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  color: Color(pairedHabit.habit.color),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: normalizedNow() == pairedHabit.historyRecord?.forDate
                    ? Center(
                        child: Icon(Icons.login,
                            color: Theme.of(context).scaffoldBackgroundColor),
                      )
                    : Container(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pairedHabit.habit.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      getText(),
                      style: TextStyle(
                        color: pairedHabit.historyRecord?.isDone == true
                            ? Color(pairedHabit.habit.color)
                            : Colors.white38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
