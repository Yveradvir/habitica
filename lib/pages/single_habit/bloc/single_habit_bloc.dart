import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_habit_event.dart';
part 'single_habit_state.dart';

class SingleHabitBloc extends Bloc<SingleHabitEvent, SingleHabitState> {
  SingleHabitBloc() : super(SingleHabitInitial()) {
    on<SingleHabitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
