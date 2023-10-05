import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style/responsive_screen.dart';
import '../widget/vertical_split_text.dart';

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
      body: ResponsiveScreen(
        mainAreaProminence: 0.45,
        squarishMainArea: _mainContent(),
        rectangularMenuArea: _menuContent(context),
      ),
    );
  }

  Widget _mainContent() => _title();

  Widget _menuContent(BuildContext context) => _button(
        'Play',
        onPressed: () => GoRouter.of(context).go('/play'),
      );

  Widget _title() {
    return Center(
      child: VerticalSplitText(
        text: title,
        style: const TextStyle(
          fontFamily: 'Permanent Marker',
          fontWeight: FontWeight.bold,
          fontSize: 64,
          height: 1,
        ),
        spacing: 24,
        upperCase: true,
      ),
    );
  }

  Widget _button(String text, {VoidCallback? onPressed}) {
    return SizedBox(
      width: 128,
      height: 64,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            inherit: true,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
