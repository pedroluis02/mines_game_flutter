import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLifeCycleState = useAppLifecycleState();
    debugPrint('appLifeCycleState: ${appLifeCycleState?.name}');

    useOnAppLifecycleStateChange((previous, current) {
      debugPrint('useOnAppLifecycleStateChange: $current');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Text('Mines Game - Flutter casual game toolkit'),
      ),
    );
  }
}