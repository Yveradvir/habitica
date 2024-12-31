// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habitica/core/const.dart';
import 'package:meta/meta.dart';

part 'new_habit_event.dart';
part 'new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc()
      : super(NewHabitInitial(
          type: "standart",
          includes: List.from(["Mon"]),
          count: 0,
          duration: 0,
          color: colorPallete.values.first,
        )) {
    on<NewHabitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
