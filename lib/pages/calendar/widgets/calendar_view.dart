import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import '../bloc/calendar_bloc.dart';
import 'month_view.dart';

class CalendarView extends StatefulWidget {
  final DateTime initialDate;

  const CalendarView({super.key, required this.initialDate});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late PageController _pageController;
  late int initialPage;
  late DateTime activeDate;

  @override
  void initState() {
    super.initState();
    activeDate = widget.initialDate;
    initialPage = activeDate.year * 12 + activeDate.month - 1;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (context, index) {
        final year = index ~/ 12;
        final month = index % 12 + 1;
        final displayedMonth = DateTime(year, month);
        return MonthView(
          displayedMonth: displayedMonth,
          activeDate: activeDate,
          onDaySelected: (selectedDate) {
            setState(() {
              activeDate = normalizeDate(selectedDate);
            });
            context
                .read<CalendarBloc>()
                .add(CalendarChangeDataEvent(date: activeDate));
          },
        );
      },
    );
  }
}
