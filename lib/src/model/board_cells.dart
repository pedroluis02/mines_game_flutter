import 'board_cell.dart';

class BoardCellArray {
  final int rows;
  final int columns;
  late final List<List<BoardCell>> _cells;

  BoardCellArray(this.rows, this.columns) {
    assert(rows > 0);
    assert(columns > 0);

    _cells = _creteCells();
  }

  BoardCell cell(int row, int column) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    assert(column >= 0 && column < columns, '$columns should be between 0 and ${columns - 1}');

    return _cells[row][column];
  }

  void setCell(int row, int column, BoardCell newCell) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    assert(column >= 0 && column < columns, '$columns should be between 0 and ${columns - 1}');

    _cells[row][column] = newCell;
  }

  List<BoardCell> rowCells(int row) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    return _cells[row];
  }

  _creteCells() {
    return List.generate(
      rows,
      (row) => List.generate(
        columns,
        (column) => BoardCell(row, column),
      ).toList(),
    ).toList();
  }
}
