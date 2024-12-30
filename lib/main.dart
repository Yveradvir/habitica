import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return const Placeholder();
  }
}
