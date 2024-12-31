import 'package:flutter/material.dart';

class HabitColorField extends StatefulWidget {
  final Color color;
  const HabitColorField({super.key, required this.color});

  @override
  State<HabitColorField> createState() => _HabitColorFieldState();
}

class _HabitColorFieldState extends State<HabitColorField> {
  late final Color color;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => showColorPicker(context),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black12),
              ),
              child: Center(
                child: Text(
                  'Selected Color',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: color.computeLuminance() > 0.5
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showColorPicker(BuildContext parentContext) {}
}
