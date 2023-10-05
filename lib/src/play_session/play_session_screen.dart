import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/models.dart';
import '../widget/board.dart';

class PlaySessionScreen extends HookConsumerWidget {
  static final _board = SquareBoard(10);

  const PlaySessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BoardView(
              _board,
              onCellTap: (cell) {
                debugPrint(cell.toString());
              },
            ),
          ),
        ),
      ),
    );
  }
}
