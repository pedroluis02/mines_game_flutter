enum BoardCellType { number, mine }

enum BoardCellState { hidden, visible, flagged }

class BoardCell {
  final int row;
  final int column;

  final BoardCellType type;
  final BoardCellState state;

  const BoardCell(
    this.row,
    this.column, {
    this.type = BoardCellType.number,
    this.state = BoardCellState.hidden,
  });

  bool get isVisible => (state == BoardCellState.visible);

  @override
  String toString() {
    return 'TableCellModel(cell=[$row, $column], type=${type.name}, state=${state.name})';
  }
}
