import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/pages/new_habit/bloc/new_habit_bloc.dart';

class HabitNameField extends StatefulWidget {
  const HabitNameField({super.key});

  @override
  State<HabitNameField> createState() => _HabitNameFieldState();
}

class _HabitNameFieldState extends State<HabitNameField> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextFormField(
        onChanged: (String newText) {
          context.read<NewHabitBloc>().add(NewHabitChangeEvent(name: newText));
        },
        controller: nameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter a habit name",
          hintStyle: Theme.of(context).textTheme.titleSmall,
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
