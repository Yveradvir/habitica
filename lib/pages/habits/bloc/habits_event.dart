part of 'habits_bloc.dart';

@immutable
sealed class HabitsEvent {}

final class LoadHabits extends HabitsEvent {
  final AppDb db;
  final DateTime date;

  LoadHabits({required this.db, required this.date});
}
