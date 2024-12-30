import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitica/core/const.dart';
import 'package:habitica/core/service/navigation/widget.dart';
import 'package:provider/provider.dart';

import 'package:habitica/core/theme.dart';
import 'package:habitica/core/service/database/database.dart';

void main() {
  runApp(Provider(
    create: (context) => AppDb(),
    dispose: (context, db) => db.close(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providersList,
        child: MaterialApp(
          title: 'Habitica',
          theme: themeData,
          home: NavigationRouter(),
        ));
  }
}
