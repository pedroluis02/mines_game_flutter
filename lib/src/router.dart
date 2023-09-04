import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'main_screen/main_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const MainScreen(
          title: 'Mines',
          key: Key('MainScreen'),
        ),
      )
    ],
  );
}
