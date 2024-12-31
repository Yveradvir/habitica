import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/navigation/cubit.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';
import 'package:habitica/pages/new_habit/widgets/habit_color.dart';
import 'package:habitica/pages/new_habit/widgets/habit_count.dart';
import 'package:habitica/pages/new_habit/widgets/habit_duration.dart';
import 'package:habitica/pages/new_habit/widgets/habit_includes.dart';
import 'package:habitica/pages/new_habit/widgets/habit_name.dart';
import 'package:habitica/pages/new_habit/widgets/habit_type.dart';

class NewHabitPageScreen extends StatelessWidget {
  const NewHabitPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: BlocListener<NewHabitBloc, NewHabitState>(
        listener: (context, state) {
          if (state is NewHabitError) {
            // TODO: Handle error state
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
              return _buildHabitForm(state);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildHabitForm(NewHabitInitial state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _verticalSpacing(16),
          const HabitNameField(),
          _verticalSpacing(16),
          HabitColorField(color: state.color!),
          _verticalSpacing(24),
          HabitTypeField(type: state.type!, color: state.color!),
          if (state.type != "standart") _verticalSpacing(8),
          _buildSpecificHabitField(state),
          _verticalSpacing(16),
          HabitIncludesField(color: state.color!, includes: state.includes!),
        ],
      ),
    );
  }

  Widget _buildSpecificHabitField(NewHabitInitial state) {
    if (state.type == "count") {
      return HabitCountField(color: state.color!, count: state.count!);
    } else if (state.type == "timer") {
      return HabitDurationField(color: state.color!, duration: state.duration!);
    }
    return Container();
  }

  Widget _verticalSpacing(double height) {
    return SizedBox(height: height);
  }
}
