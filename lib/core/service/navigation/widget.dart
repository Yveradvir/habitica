import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habitica/core/service/navigation/cubit.dart';
import 'package:habitica/core/service/navigation/splash_screen.dart';

import 'package:habitica/pages/habits/screen.dart';
import 'package:habitica/pages/calendar/screen.dart';
import 'package:habitica/pages/new_habit/screen.dart';
import 'package:habitica/pages/single_habit/screen.dart';

class NavigationRouter extends StatelessWidget {
  const NavigationRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (state is SplashPageState) {
          return SplashScreen();
        } else if (state is HabitsPageState) {
          return HabitsPageScreen();
        } else if (state is CalendarPageState) {
          return CalendarPageScreen();
        } else if (state is NewHabitPageState) {
          return NewHabitPageScreen();
        } else if (state is SingleHabitPageState) {
          return SingleHabitPageScreen();
        }

        return Container();
      },
    );
  }
}
