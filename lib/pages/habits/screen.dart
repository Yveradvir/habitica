import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/habits/bloc/habits_bloc.dart';
import 'package:habitica/pages/habits/widgets/habits_view.dart';

class HabitsPageScreen extends StatelessWidget {
  const HabitsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: BlocListener<HabitsBloc, HabitsState>(
        listener: (context, state) {
          if (state is HabitsError) {
            // TODO: Implement here.
          }
        },
        child: BlocBuilder<HabitsBloc, HabitsState>(builder: (context, state) {
          if (state is HabitsInitial) {
            return const Center(child: Text('Welcome!'));
          } else if (state is HabitsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HabitsLoaded) {
            return HabitsView();
          } else if (state is HabitsEmpty) {
            return const Center(child: Text('No habits found.'));
          }

          return Container();
        }),
      ),
    );
  }
}
