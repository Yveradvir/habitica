import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final DateTime date;
  final bool isActive;
  final VoidCallback onTap;

  const DayCard({
    super.key,
    required this.date,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? theme.primaryColor : theme.cardColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          '${date.day}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isActive ? Colors.white : theme.textTheme.bodyMedium?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
