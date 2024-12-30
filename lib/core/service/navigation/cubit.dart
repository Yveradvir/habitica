import 'package:bloc/bloc.dart';

abstract class NavigationState {}

class HabitsPageState extends NavigationState {}

class CalendarPageState extends NavigationState {}

class NewHabitPageState extends NavigationState {}

class SingleHabitPageState extends NavigationState {}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(HabitsPageState());

  void goToHabits() => emit(HabitsPageState());
  void goToCalendar() => emit(CalendarPageState());
  void goToNewHabit() => emit(NewHabitPageState());
  void goToSingleHabit() => emit(SingleHabitPageState());
}
