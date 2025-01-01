part of 'habits_bloc.dart';

@immutable
sealed class HabitsState {}

final class HabitsInitial extends HabitsState {}

final class HabitsLoading extends HabitsState {}

final class HabitsLoaded extends HabitsState {
  final List<PairedHabit> pairedHabits;

  HabitsLoaded({required this.pairedHabits});
}

final class HabitsEmpty extends HabitsState {}

final class HabitsError extends HabitsState {}
