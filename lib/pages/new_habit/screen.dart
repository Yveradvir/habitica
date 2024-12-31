import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/navigation/cubit.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';
import 'package:habitica/pages/new_habit/widgets/habit_color.dart';
import 'package:habitica/pages/new_habit/widgets/habit_name.dart';

class NewHabitPageScreen extends StatelessWidget {
  const NewHabitPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: BlocListener<NewHabitBloc, NewHabitState>(
        listener: (context, state) {
          if (state is NewHabitError) {
            // TODO: Make a capurtino error with saving the state.
          } else if (state is NewHabitSuccess) {
            context
                .read<CalendarBloc>()
                .add(CalendarChangeDataEvent(date: normalizedNow()));
            context.read<NavigationCubit>().goToHabits();
          }
        },
        child: BlocBuilder<NewHabitBloc, NewHabitState>(
          builder: (context, state) {
            if (state is NewHabitInitial) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    HabitNameField(),
                    const SizedBox(height: 16),
                    HabitColorField(color: state.color!),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
