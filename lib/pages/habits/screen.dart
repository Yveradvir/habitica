import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'package:habitica/pages/habits/bloc/habits_bloc.dart';
import 'package:habitica/pages/habits/widgets/habits_view.dart';
import 'package:provider/provider.dart';

class HabitsPageScreen extends StatelessWidget {
  const HabitsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: BlocListener<HabitsBloc, HabitsState>(
        listener: (context, state) {
          if (state is HabitsError) {
            // TODO: Implement error handling.
          }
        },
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, calendarState) {
            var date =
                (calendarState as CalendarInitial).date ?? normalizedNow();
            var db = Provider.of<AppDb>(context, listen: false);
            context.read<HabitsBloc>().add(LoadHabits(db: db, date: date));
            return BlocBuilder<HabitsBloc, HabitsState>(
              builder: (context, habitsState) {
                if (habitsState is HabitsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (habitsState is HabitsLoaded) {
                  return HabitsView();
                } else if (habitsState is HabitsEmpty) {
                  return const Center(child: Text('No habits found.'));
                }

                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
