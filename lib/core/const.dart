import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habitica/core/service/navigation/cubit.dart';

import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'package:habitica/pages/habits/bloc/habits_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';
import 'package:habitica/pages/single_habit/bloc/single_habit_bloc.dart';

const colorPallete = {
  "blue": Color.fromARGB(255, 124, 184, 255),
  "pink": Color.fromARGB(255, 249, 37, 125),
  "green": Color.fromARGB(255, 118, 224, 115),
  "purple": Color.fromARGB(255, 238, 132, 255),
  "yellow": Color.fromARGB(255, 255, 253, 118),
  "orange": Color.fromARGB(255, 255, 179, 81),
  "lightBlue": Color.fromARGB(255, 169, 232, 255),
  "lavender": Color.fromARGB(255, 204, 175, 255),
  "coral": Color.fromARGB(255, 255, 121, 88),
};

final weekDays = List.from(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]);

List<BlocProvider> providersList = [
  BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
  BlocProvider<CalendarBloc>(create: (create) => CalendarBloc()),
  BlocProvider<HabitsBloc>(create: (create) => HabitsBloc()),
  BlocProvider<NewHabitBloc>(create: (create) => NewHabitBloc()),
  BlocProvider<SingleHabitBloc>(create: (create) => SingleHabitBloc()),
];
