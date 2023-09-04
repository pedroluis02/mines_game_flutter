import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mines Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mines'),
    );
  }
}

class MyHomePage extends StatefulHookWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: Text('Mines Game - Flutter'),
      ),
    );
  }
}
