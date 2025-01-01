import 'package:bloc/bloc.dart';
import 'package:habitica/core/service/database/database.dart';
import 'package:habitica/core/service/database/functions/pairing.dart';
import 'package:meta/meta.dart';

part 'habits_event.dart';
part 'habits_state.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {
  HabitsBloc() : super(HabitsInitial()) {
    on<LoadHabits>((event, emit) async {
      emit(HabitsLoading());

      final pairedHabits = await getPairedHabits(event.db, event.date);
      print(pairedHabits);

      if (pairedHabits.isEmpty) {
        emit(HabitsEmpty());
        return;
      }

      emit(HabitsLoaded(pairedHabits: pairedHabits));
    });
  }
}
