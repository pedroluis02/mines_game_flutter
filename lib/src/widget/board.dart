import 'package:flutter/material.dart';

import '../model/board.dart';
import '../model/board_cell.dart';
import 'board_cell.dart';

class BoardView extends StatelessWidget {
  final Board model;

  final ValueChanged<BoardCell>? onCellTap;

  const BoardView(this.model, {this.onCellTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _cells(),
    );
  }

  List<Widget> _cells() {
    var widgets = <Widget>[];

    for (var x = 0; x < model.rows; x++) {
      final rowItems =
          model.allRow(x).map((cell) => BoardCellView(cell, onTap: onCellTap)).toList();
      widgets.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: rowItems,
        ),
      );
    }

    return widgets;
  }
}
