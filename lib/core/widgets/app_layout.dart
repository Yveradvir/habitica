import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habitica/core/service/navigation/cubit.dart';

class AppLayout extends StatefulWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  void _onItemTapped(int index) {
    var cubit = context.read<NavigationCubit>();

    switch (index) {
      case 0:
        cubit.goToHabits();
        break;
      case 1:
        cubit.goToNewHabit();
        break;
      case 2:
        cubit.goToCalendar();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int currentIndex;
        if (state is HabitsPageState) {
          currentIndex = 0;
        } else if (state is NewHabitPageState) {
          currentIndex = 1;
        } else if (state is CalendarPageState) {
          currentIndex = 2;
        } else {
          currentIndex = 0;
        }

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: widget.child,
          appBar: AppBar(
            title: Text('Habitica',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: _onItemTapped,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.white54,
                type: BottomNavigationBarType.fixed,
                enableFeedback: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.house),
                    label: 'Habits',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.plus),
                    label: 'New Habit',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.calendar),
                    label: 'Calendar',
                  ),
                ],
                selectedLabelStyle: Theme.of(context).textTheme.labelLarge,
                unselectedLabelStyle: Theme.of(context).textTheme.labelMedium),
          ),
        );
      },
    );
  }
}
