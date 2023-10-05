import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main_screen/main_screen.dart';
import 'play_session/play_session_screen.dart';
import 'style/my_transition.dart';

final class MainGoRouterCreator {
  GoRouter create() {
    return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            builder: (_, __) => const MainScreen(
                  title: 'Mines',
                  key: Key('MainScreen'),
                ),
            routes: [_playRoute()])
      ],
    );
  }

  GoRoute _playRoute() {
    return GoRoute(
      path: 'play',
      pageBuilder: (context, __) => buildMyTransition<void>(
        key: const ValueKey('play'),
        color: Theme.of(context).primaryColor,
        child: const PlaySessionScreen(
          key: Key('PlayGame'),
        ),
      ),
    );
  }
}
