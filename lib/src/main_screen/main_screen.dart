import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends StatefulHookWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final appLifeCycleState = useAppLifecycleState();
    debugPrint('appLifeCycleState: ${appLifeCycleState?.name}');

    useOnAppLifecycleStateChange((previous, current) {
      debugPrint('useOnAppLifecycleStateChange: $current');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Mines Game - Flutter casual game toolkit'),
      ),
    );
  }
}
