part of 'new_habit_bloc.dart';

@immutable
sealed class NewHabitState {}

final class NewHabitInitial extends NewHabitState {
  final String? name;
  final Color? color;
  final String? type;
  final List<String>? includes;
  final int? count;
  final int? duration;

  NewHabitInitial(
      {this.name,
      this.color,
      this.type,
      this.includes,
      this.count,
      this.duration});
}

final class NewHabitSubmitting extends NewHabitState {}

final class NewHabitError extends NewHabitState {}

final class NewHabitSuccess extends NewHabitEvent {}
