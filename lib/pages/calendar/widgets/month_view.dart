import 'package:flutter/material.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'day_card.dart';

class MonthView extends StatelessWidget {
  final DateTime displayedMonth;
  final DateTime activeDate;
  final ValueChanged<DateTime> onDaySelected;

  const MonthView({
    super.key,
    required this.displayedMonth,
    required this.activeDate,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final daysInMonth = List.generate(
      DateTime(displayedMonth.year, displayedMonth.month + 1, 0).day,
      (index) => DateTime(displayedMonth.year, displayedMonth.month, index + 1),
    );

    final monthName = _getMonthName(displayedMonth.month);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            '$monthName ${displayedMonth.year}',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: daysInMonth.length,
            itemBuilder: (context, index) {
              final day = daysInMonth[index];
              final isActive = isDatesEqual(day, activeDate);

              return DayCard(
                date: day,
                isActive: isActive,
                onTap: () => onDaySelected(day),
              );
            },
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
