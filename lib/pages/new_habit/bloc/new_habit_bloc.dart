import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_habit_event.dart';
part 'new_habit_state.dart';

class NewHabitBloc extends Bloc<NewHabitEvent, NewHabitState> {
  NewHabitBloc() : super(NewHabitInitial()) {
    on<NewHabitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
