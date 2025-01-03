part of 'single_habit_bloc.dart';

@immutable
sealed class SingleHabitState {}

final class SingleHabitInitial extends SingleHabitState {
  final int id;

  SingleHabitInitial({required this.id});
}

final class SingleHabitLoading extends SingleHabitState {}

final class SingleHabitLoaded extends SingleHabitState {
  final PairedHabit pairedHabit;

  SingleHabitLoaded({required this.pairedHabit});
}

final class SingleHabitError extends SingleHabitState {
  final String message;

  SingleHabitError({required this.message});
}
