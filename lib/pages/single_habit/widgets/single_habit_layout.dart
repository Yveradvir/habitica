import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/service/navigation/cubit.dart';

class SingleHabitLayout extends StatelessWidget {
  final Color color;
  final Widget child;

  const SingleHabitLayout(
      {super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Habitica',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).scaffoldBackgroundColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).scaffoldBackgroundColor),
          onPressed: () {
            context.read<NavigationCubit>().goToHabits();
          },
        ),
      ),
      body: child,
    );
  }
}
