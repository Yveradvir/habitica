part of 'single_habit_bloc.dart';

@immutable
sealed class SingleHabitEvent {}

final class LoadSingleHabit extends SingleHabitEvent {
  final AppDb db;
  final int id;

  LoadSingleHabit({required this.db, required this.id});
}
