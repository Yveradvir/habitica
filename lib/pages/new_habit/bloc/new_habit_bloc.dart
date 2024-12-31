// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habitica/core/const.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'new_habit_event.dart';
part 'new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc()
      : super(NewHabitInitial(
          type: "standart",
          includes: List.from(weekDays),
          count: 1,
          duration: 0,
          color: colorPallete.values.first,
        )) {
    on<NewHabitChangeEvent>((event, emit) {
      final cState = state as NewHabitInitial;

      emit(NewHabitInitial(
        name: event.name ?? cState.name,
        color: event.color ?? cState.color,
        count: event.count ?? cState.count,
        duration: event.duration ?? cState.duration,
        includes: event.includes ?? cState.includes,
        type: event.type ?? cState.type,
      ));
    });
  }
}
