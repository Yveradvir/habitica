// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:habitica/core/const.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/service/database/controllers/habit_controller.dart';
import 'package:habitica/core/service/database/database.dart';
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
      late NewHabitInitial cState;

      if (state is NewHabitInitial) {
        cState = state as NewHabitInitial;
      } else if (state is NewHabitError) {
        cState = (state as NewHabitError).storagedState;
      } else {
        return;
      }

      emit(NewHabitInitial(
        name: event.name ?? cState.name,
        color: event.color ?? cState.color,
        count: event.count ?? cState.count,
        duration: event.duration ?? cState.duration,
        includes: event.includes ?? cState.includes,
        type: event.type ?? cState.type,
      ));
    });

    on<NewHabitSubmitEvent>((event, emit) async {
      if (state is NewHabitInitial) {
        final currentState = state as NewHabitInitial;
        emit(NewHabitSubmitting());

        if (currentState.name == null || currentState.name!.isEmpty) {
          emit(NewHabitError("Habit name cannot be empty.", currentState));
          return;
        }

        if (currentState.color == null) {
          emit(NewHabitError("Habit color must be selected.", currentState));
          return;
        }

        if (currentState.type == null || currentState.type!.isEmpty) {
          emit(NewHabitError("Habit type must be selected.", currentState));
          return;
        }

        if (currentState.includes == null || currentState.includes!.isEmpty) {
          emit(NewHabitError(
              "Habit must include at least one item.", currentState));
          return;
        }

        final habit = HabitCompanion(
          name: Value(currentState.name!),
          color: Value((currentState.color!).value),
          include: Value(currentState.includes!.join(",")),
          count: Value(currentState.count!),
          duration: Value(currentState.duration!),
          type: Value(currentState.type!),
          createdAt: Value(normalizedNow()),
        );

        try {
          await HabitController(event.db).create(habit);

          emit(NewHabitSuccess());
          emit(NewHabitInitial(
            type: "standart",
            includes: List.from(weekDays),
            count: 1,
            duration: 0,
            color: colorPallete.values.first,
          ));
        } catch (e) {
          emit(NewHabitError(
              "Failed to create habit: ${e.toString()}", currentState));
        }
      }
    });
  }
}
