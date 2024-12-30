import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/functions/datetime.dart';
import 'package:habitica/core/widgets/app_layout.dart';
import 'package:habitica/pages/calendar/bloc/calendar_bloc.dart';
import 'widgets/calendar_view.dart';

class CalendarPageScreen extends StatelessWidget {
  const CalendarPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        final DateTime? date = (state as CalendarInitial).date;

        if (date == null) {
          context
              .read<CalendarBloc>()
              .add(CalendarChangeDataEvent(date: normalizedNow()));
        }

        return AppLayout(
            child: CalendarView(initialDate: date ?? normalizedNow()));
      },
    );
  }
}
