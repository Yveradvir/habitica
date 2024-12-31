part of 'new_habit_bloc.dart';

@immutable
sealed class NewHabitEvent {}

final class NewHabitChangeEvent extends NewHabitEvent {
  final String? name;
  final Color? color;
  final String? type;
  final List<String>? includes;
  final int? count;
  final int? duration;

  NewHabitChangeEvent(
      {this.name,
      this.color,
      this.type,
      this.includes,
      this.count,
      this.duration});
}

final class NewHabitSubmitEvent extends NewHabitEvent {}
