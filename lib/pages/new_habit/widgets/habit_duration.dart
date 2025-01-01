import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';

class HabitDurationField extends StatefulWidget {
  final int duration;
  final Color color;

  const HabitDurationField(
      {super.key, required this.duration, required this.color});

  @override
  State<HabitDurationField> createState() => _HabitDurationFieldState();
}

class _HabitDurationFieldState extends State<HabitDurationField> {
  late int duration;
  late Color color;

  @override
  void initState() {
    super.initState();

    duration = widget.duration;
    color = widget.color;
  }

  @override
  void didUpdateWidget(covariant HabitDurationField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      setState(() {
        color = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: GestureDetector(
        onTap: () => showBottomTimePicker(context, color),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12),
          ),
          child: Center(
            child: Text(
              formatSecondsToString(duration),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color.computeLuminance() > 0.5
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ))
    ]);
  }

  void showBottomTimePicker(BuildContext parentContext, Color color) {
    showModalBottomSheet(
      context: parentContext,
      builder: (context) {
        Duration selectedDuration =
            const Duration(hours: 0, minutes: 0, seconds: 0);
        final theme = Theme.of(context);

        return Container(
          height: 300,
          color: theme.scaffoldBackgroundColor,
          child: Column(
            children: [
              Container(
                color: theme.cardColor,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Time',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, selectedDuration);
                        parentContext.read<NewHabitBloc>().add(
                            NewHabitChangeEvent(
                                duration: selectedDuration.inSeconds));
                        setState(() {
                          duration = selectedDuration.inSeconds;
                        });
                      },
                      child: Text(
                        'Done',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hms,
                  initialTimerDuration: selectedDuration,
                  onTimerDurationChanged: (Duration newDuration) {
                    selectedDuration = newDuration;
                    setState(() {
                      duration = newDuration.inSeconds;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String formatSecondsToString(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
