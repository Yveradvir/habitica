// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/database.dart';
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
import 'package:provider/provider.dart';

class NewHabitPageScreen extends StatelessWidget {
  const NewHabitPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: BlocListener<NewHabitBloc, NewHabitState>(
        listener: (context, state) {
          if (state is NewHabitError) {
            _showErrorDialog(context, state);
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
              return _buildHabitForm(context, state);
            } else if (state is NewHabitSubmitting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, NewHabitInitial state) {
    return GestureDetector(
      onTap: () {
        context.read<NewHabitBloc>().add(NewHabitSubmitEvent(
              db: Provider.of<AppDb>(context, listen: false),
            ));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: state.color,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: state.color!.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Save Habit",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: state.color!.computeLuminance() > 0.5
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildHabitForm(BuildContext context, NewHabitInitial state) {
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
          _verticalSpacing(24),
          _buildSubmitButton(context, state)
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

  void _showErrorDialog(BuildContext parentContext, NewHabitError state) {
    showCupertinoDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Error"),
          content: Text(state.message),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                parentContext.read<NewHabitBloc>().add(NewHabitChangeEvent());
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
