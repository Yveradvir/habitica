import 'dart:async';
import 'package:flutter/material.dart';
import 'package:habitica/core/service/database/controllers/history_record_controller.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/service/navigation/cubit.dart';
import 'package:habitica/pages/single_habit/bloc/single_habit_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypedCard extends StatefulWidget {
  final HistoryRecordData record;
  final HabitData habit;

  const TypedCard({super.key, required this.habit, required this.record});

  @override
  State<TypedCard> createState() => _TypedCardState();
}

class _TypedCardState extends State<TypedCard> {
  late final HistoryRecordData record;
  late final HabitData habit;

  Timer? _timer;
  bool _isRunning = false;
  int _elapsedTime = 0;

  @override
  void initState() {
    super.initState();
    record = widget.record;
    habit = widget.habit;
    _elapsedTime = record.currentDuration ?? 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _stopTimer();
    super.dispose();
  }

  void _stopTimer() {
    if (!_isRunning || !mounted) return;
    _timer?.cancel();
    _timer = null;

    if (mounted) {
      setState(() {
        _isRunning = false;
      });
    }

    final db = Provider.of<AppDb>(context, listen: false);
    HistoryRecordController(db).updateDynamic(
      existingRecord: record,
      habit: habit,
      duration: _elapsedTime,
    );
    context.read<SingleHabitBloc>().add(LoadSingleHabit(db: db, id: record.id));
  }

  void _startTimer() {
    if (_isRunning) return;
    if (!mounted) return;

    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _elapsedTime++;
      });
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  void _saveStateBeforeNavigation() {
    final db = Provider.of<AppDb>(context, listen: false);
    HistoryRecordController(db).updateDynamic(
      existingRecord: record,
      habit: habit,
      duration: _elapsedTime,
    );
    context.read<SingleHabitBloc>().add(LoadSingleHabit(db: db, id: record.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is! SingleHabitPageState) {
          _saveStateBeforeNavigation();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (habit.type == 'standart')
                ...getStandart(context)
              else if (habit.type == 'count')
                ...getCount(context)
              else if (habit.type == 'timer')
                ...getTimer(context)
            ],
          ),
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

  List<Widget> getCount(BuildContext context) {
    final theme = Theme.of(context);

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (record.currentCount! > 0) {
                final db = Provider.of<AppDb>(context, listen: false);
                HistoryRecordController(db).updateDynamic(
                    existingRecord: record,
                    habit: habit,
                    count: record.currentCount! - 1);
                context
                    .read<SingleHabitBloc>()
                    .add(LoadSingleHabit(db: db, id: record.id));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color(habit.color),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                Icons.remove,
                color: theme.scaffoldBackgroundColor,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Text(
              "${record.currentCount} / ${habit.count}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: record.isDone ? Color(habit.color) : Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          GestureDetector(
            onTap: () {
              final db = Provider.of<AppDb>(context, listen: false);
              HistoryRecordController(db).updateDynamic(
                  existingRecord: record,
                  habit: habit,
                  count: record.currentCount! + 1);
              context
                  .read<SingleHabitBloc>()
                  .add(LoadSingleHabit(db: db, id: record.id));
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color(habit.color),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                Icons.add,
                color: theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> getTimer(BuildContext context) {
    final theme = Theme.of(context);

    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${formatSecondsToString(_elapsedTime)} / ${formatSecondsToString(habit.duration!)}",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(width: 24),
          GestureDetector(
            onTap: _toggleTimer,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color(habit.color),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                _isRunning ? Icons.pause : Icons.play_arrow,
                color: theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  String formatSecondsToString(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
