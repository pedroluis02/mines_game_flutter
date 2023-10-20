import 'package:mines_game_flutter/src/base/cell.dart';

enum BoardCellType { number, mine }

enum BoardCellState { hidden, visible, flagged }

class BoardCell extends AbstractCell {
  final BoardCellType type;
  final BoardCellState state;

  const BoardCell(
    int row,
    int column, {
    this.type = BoardCellType.number,
    this.state = BoardCellState.hidden,
  }) : super(row, column);

  bool get isVisible => (state == BoardCellState.visible);

  @override
  String toString() {
    return 'BoardCell(cell=[$row, $column], type=${type.name}, state=${state.name})';
  }
}
