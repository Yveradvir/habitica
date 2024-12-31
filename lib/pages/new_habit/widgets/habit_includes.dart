import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/const.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';

class HabitIncludesField extends StatefulWidget {
  final Color color;
  final List<String> includes;

  const HabitIncludesField(
      {super.key, required this.color, required this.includes});

  @override
  State<HabitIncludesField> createState() => _HabitIncludesFieldState();
}

class _HabitIncludesFieldState extends State<HabitIncludesField> {
  late List<String> includes;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    includes = widget.includes;
  }

  @override
  void didUpdateWidget(covariant HabitIncludesField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      setState(() {
        color = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        isSelected: weekDays.map((day) => includes.contains(day)).toList(),
        onPressed: (index) {
          String day = weekDays[index];
          setState(() {
            if (includes.contains(day)) {
              if (includes.length > 1) {
                includes.remove(day);
              }
            } else {
              includes.add(day);
            }
          });

          context
              .read<NewHabitBloc>()
              .add(NewHabitChangeEvent(includes: includes));
        },
        splashColor: Colors.transparent,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        borderWidth: 0,
        children: weekDays.map((day) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: includes.contains(day)
                  ? color // Используем color напрямую
                  : Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color: includes.contains(day)
                      ? color.computeLuminance() > 0.5
                          ? Theme.of(context).scaffoldBackgroundColor
                          : Colors.white
                      : color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
