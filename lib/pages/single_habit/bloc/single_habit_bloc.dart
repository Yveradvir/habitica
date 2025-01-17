import 'package:bloc/bloc.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/service/database/functions/pairing.dart';
import 'package:meta/meta.dart';

part 'single_habit_event.dart';
part 'single_habit_state.dart';

class SingleHabitBloc extends Bloc<SingleHabitEvent, SingleHabitState> {
  SingleHabitBloc() : super(SingleHabitInitial(id: 0)) {
    on<LoadSingleHabit>((event, emit) async {
      print("LoadSingleHabit ${event.id}");
      emit(SingleHabitInitial(id: event.id));
      emit(SingleHabitLoading());
      try {
        final PairedHabit pairedHabit =
            await getPairedHabit(event.db, event.id);
        emit(SingleHabitLoaded(pairedHabit: pairedHabit));
      } catch (e) {
        emit(SingleHabitError(message: e.toString()));
      }
    });
  }
}
