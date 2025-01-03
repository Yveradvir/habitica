import 'package:flutter/material.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/service/database/functions/pairing.dart';
import 'package:habitica/pages/single_habit/widgets/single_habit_layout.dart';
import 'package:habitica/pages/single_habit/widgets/typed_card.dart';

class SingleHabitView extends StatefulWidget {
  final PairedHabit pairedHabit;

  const SingleHabitView({super.key, required this.pairedHabit});

  @override
  State<SingleHabitView> createState() => _SingleHabitViewState();
}

class _SingleHabitViewState extends State<SingleHabitView> {
  late HabitData habit;
  late HistoryRecordData record;

  @override
  void initState() {
    super.initState();
    habit = widget.pairedHabit.habit;
    if (widget.pairedHabit.historyRecord != null) {
      record = widget.pairedHabit.historyRecord!;
    }
  }

  @override
  void didUpdateWidget(covariant SingleHabitView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pairedHabit != widget.pairedHabit) {
      habit = widget.pairedHabit.habit;
      if (widget.pairedHabit.historyRecord != null) {
        record = widget.pairedHabit.historyRecord!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleHabitLayout(
      color: Color(habit.color),
      child: Stack(
        children: [
          Container(
            height: 900,
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.1),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        habit.name,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TypedCard(
                      habit: habit,
                      record: record,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
