import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';

class HabitTypeField extends StatefulWidget {
  final String type;
  final Color color;

  const HabitTypeField({super.key, required this.type, required this.color});

  @override
  State<HabitTypeField> createState() => _HabitTypeFieldState();
}

class _HabitTypeFieldState extends State<HabitTypeField> {
  late String type;
  late Color color;

  @override
  void initState() {
    super.initState();

    type = widget.type;
    color = widget.color;
  }

  @override
  void didUpdateWidget(covariant HabitTypeField oldWidget) {
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
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ['standart', 'count', 'timer']
            .map((type) => _buildRadioButton(type))
            .toList(),
      ),
    );
  }

  Widget _buildRadioButton(String thisType) {
    bool isSelected = type == thisType;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onRadioButtonTapped(thisType),
        child: _buildRadioContainer(thisType, isSelected),
      ),
    );
  }

  void _onRadioButtonTapped(String thisType) {
    setState(() {
      type = thisType;
    });

    context.read<NewHabitBloc>().add(NewHabitChangeEvent(type: thisType));
  }

  Widget _buildRadioContainer(String type, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.transparent,
        borderRadius: BorderRadius.horizontal(
          left: type == 'standart' ? const Radius.circular(30) : Radius.zero,
          right: type == 'timer' ? const Radius.circular(30) : Radius.zero,
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            color: isSelected
                ? color.computeLuminance() > 0.5
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Colors.white
                : color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
