import 'package:bloc/bloc.dart';

abstract class NavigationState {}

class SplashPageState extends NavigationState {}

class HabitsPageState extends NavigationState {}

class CalendarPageState extends NavigationState {}

class NewHabitPageState extends NavigationState {}

class SingleHabitPageState extends NavigationState {}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(SplashPageState());

  void goToHabits() => emit(HabitsPageState());
  void goToCalendar() => emit(CalendarPageState());
  void goToNewHabit() => emit(NewHabitPageState());
  void goToSingleHabit() => emit(SingleHabitPageState());
}
