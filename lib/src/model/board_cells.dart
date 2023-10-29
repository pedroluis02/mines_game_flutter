import '../base/cell.dart';
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

  BoardCell cell(Cell cell) {
    _assertCellInRage(cell);
    return _cells[cell.row][cell.column];
  }

  void setCell(BoardCell newCell) {
    _assertCellInRage(newCell);
    _cells[newCell.row][newCell.column] = newCell;
  }

  List<BoardCell> rowCells(int row) {
    _assertRowInRange(row);
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

  _assertCellInRage(Cell cell) {
    _assertRowInRange(cell.row);
    _assertColumnInRange(cell.column);
  }

  _assertRowInRange(int row) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
  }

  _assertColumnInRange(int column) {
    assert(column >= 0 && column < columns, '$column should be between 0 and ${columns - 1}');
  }
}
