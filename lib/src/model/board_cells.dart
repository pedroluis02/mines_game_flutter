import '../base/cell.dart';
import '../base/dimension.dart';
import 'board_cell.dart';

class BoardCellArray {
  final Dimension dimension;
  late final List<List<BoardCell>> _cells;

  BoardCellArray(this.dimension) {
    assert(dimension.rows > 0);
    assert(dimension.columns > 0);

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
      dimension.rows,
      (row) => List.generate(
        dimension.columns,
        (column) => BoardCell(row, column),
      ).toList(),
    ).toList();
  }

  _assertCellInRage(Cell cell) {
    _assertRowInRange(cell.row);
    _assertColumnInRange(cell.column);
  }

  _assertRowInRange(int row) {
    assert(dimension.hasRow(row), '$row should be between 0 and ${dimension.rows - 1}');
  }

  _assertColumnInRange(int column) {
    assert(dimension.hasColumn(column), '$column should be between 0 and ${dimension.columns - 1}');
  }
}
