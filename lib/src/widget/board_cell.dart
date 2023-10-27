import 'package:flutter/material.dart';

import '../model/board_cell.dart';

class BoardCellView extends StatelessWidget {
  final BoardCell model;

  final double width;
  final double height;

  final Color color;
  final EdgeInsets padding;

  final ValueChanged<BoardCell>? onTap;

  const BoardCellView(
    this.model, {
    super.key,
    this.onTap,
    this.color = Colors.grey,
    this.padding = const EdgeInsets.all(12),
    double? width,
    double? height,
  })  : width = width ?? 50,
        height = height ?? 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {if (onTap != null) onTap!(model)},
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: const EdgeInsets.all(2),
        color: color,
        child: _contentWidget(),
      ),
    );
  }

  Widget _contentWidget() {
    return model.isMine ? const Text('M') : Text('${model.number}');
  }
}
