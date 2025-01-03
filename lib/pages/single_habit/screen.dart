import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/single_habit/bloc/single_habit_bloc.dart';
import 'package:habitica/pages/single_habit/widgets/single_habit_view.dart';

class SingleHabitPageScreen extends StatelessWidget {
  const SingleHabitPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingleHabitBloc, SingleHabitState>(
      listener: (context, state) {
        if (state is SingleHabitError) {
          // TODO: Make it
        }
      },
      child: BlocBuilder<SingleHabitBloc, SingleHabitState>(
          builder: (context, state) {
        if (state is SingleHabitLoading) {
          return AppLayout(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is SingleHabitLoaded) {
          return SingleHabitView(pairedHabit: state.pairedHabit);
        }

        return Container();
      }),
    );
  }
}
