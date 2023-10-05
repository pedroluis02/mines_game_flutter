import 'package:flutter/material.dart';

import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = MainGoRouterCreator().create();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mines Game',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigoAccent,
          background: Colors.amberAccent,
        ),
        useMaterial3: true,
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
