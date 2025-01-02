import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/const.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'package:habitica/pages/habits/bloc/habits_bloc.dart';
import 'package:habitica/pages/habits/widgets/habit_card.dart'; 

class HabitsView extends StatelessWidget {
  const HabitsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<HabitsBloc>().state as HabitsLoaded;
    final DateTime date =
        (context.read<CalendarBloc>().state as CalendarInitial).date ??
            normalizedNow();

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Text(
            '${months[date.month - 1]} ${date.day} ${weekDays[date.weekday - 1]}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: state.pairedHabits.length,
              itemBuilder: (context, index) {
                final pairedHabit = state.pairedHabits[index];
                return HabitCard(pairedHabit: pairedHabit); 
              },
            ),
          ),
        ],
      ),
    );
  }
}
