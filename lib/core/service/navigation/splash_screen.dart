import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/service/navigation/cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      context.read<NavigationCubit>().goToHabits();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.alternate_email_rounded,
              size: 100,
              color: theme.primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Habitica',
              style: TextStyle(color: theme.primaryColor, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
