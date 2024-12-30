part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

final class CalendarChangeDataEvent extends CalendarEvent {
  final DateTime date;

  CalendarChangeDataEvent({required this.date});
}
