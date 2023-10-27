import '../base/cell.dart';

enum BoardCellType { empty, number, mine }

enum BoardCellState { hidden, visible, flagged }

class BoardCell extends AbstractCell {
  final int number;
  final BoardCellType type;
  final BoardCellState state;

  const BoardCell(
    int row,
    int column, {
    this.type = BoardCellType.empty,
    this.state = BoardCellState.hidden,
    this.number = -1,
  }) : super(row, column);

  bool get isVisible => (state == BoardCellState.visible);

  bool get isMine => (type == BoardCellType.mine);

  bool get isEmpty => (type == BoardCellType.empty);

  @override
  String toString() {
    return 'BoardCell(cell=[$row, $column], type=${type.name}, state=${state.name})';
  }

  BoardCell copyWith({BoardCellType? type, BoardCellState? state, int? number}) {
    return BoardCell(
      row,
      column,
      type: type ?? this.type,
      state: state ?? this.state,
      number: number ?? this.number,
    );
  }
}
