part of 'calendar_bloc.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {
  final DateTime? date;

  CalendarInitial({this.date});
}
