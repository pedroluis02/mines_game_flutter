import 'board_cell.dart';

class Board {
  final int rows;
  final int columns;

  late final List<List<BoardCell>> _cells;

  int get size => (rows * columns);

  Board(this.rows, this.columns) : _cells = _createCells(rows, columns);

  BoardCell cell(int row, int column) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    assert(column >= 0 && column < columns, '$columns should be between 0 and ${columns - 1}');

    return _cells[row][column];
  }

  List<BoardCell> allRow(int row) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    return _cells[row];
  }

  static List<List<BoardCell>> _createCells(int rows, int columns) {
    return List.generate(
      rows,
      (row) => List.generate(
        columns,
        (column) => BoardCell(row, column, state: BoardCellState.visible),
      ).toList(),
    ).toList();
  }
}
