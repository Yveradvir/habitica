import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';

class HabitCountField extends StatefulWidget {
  final Color color;
  final int count;

  const HabitCountField({super.key, required this.color, required this.count});

  @override
  State<HabitCountField> createState() => _HabitCountFieldState();
}

class _HabitCountFieldState extends State<HabitCountField> {
  late int count;
  late Color color;

  @override
  void initState() {
    super.initState();

    count = widget.count;
    color = widget.color;
  }

  @override
  void didUpdateWidget(covariant HabitCountField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      setState(() {
        color = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                count = (count > 1) ? count - 1 : 0;
              });
              context
                  .read<NewHabitBloc>()
                  .add(NewHabitChangeEvent(count: count));
            },
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  '-',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: color.computeLuminance() > 0.5
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: color.computeLuminance() > 0.5
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
              context
                  .read<NewHabitBloc>()
                  .add(NewHabitChangeEvent(count: count));
            },
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  '+',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: color.computeLuminance() > 0.5
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
