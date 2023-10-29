import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../base/dimension.dart';
import '../game/board_creator.dart';
import '../widget/board.dart';

class PlaySessionScreen extends HookConsumerWidget {
  static final _board = BoardCreator(Dimension.create(10, 5)).create();

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
