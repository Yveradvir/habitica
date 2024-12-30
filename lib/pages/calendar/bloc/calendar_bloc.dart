import 'package:bloc/bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial(date: normalizeNow())) {
    on<CalendarChangeDataEvent>((event, emit) {
      emit(CalendarInitial(date: normalizeDate(event.date)));
    });
  }
}
