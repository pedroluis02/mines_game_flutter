import '../model/models.dart';
import 'mine_generator/mine_generator.dart';

class BoardCreator {
  final int rows;
  final int columns;
  final MineGenerator mineGenerator;

  final BoardCellArray _cells;

  BoardCreator(this.rows, this.columns, {MineGenerator? mineGenerator})
      : mineGenerator = mineGenerator ?? DefaultMineGenerator(rows, columns),
        _cells = BoardCellArray(rows, columns);

  Board create() {
    _generateAndFillMines();
    _fillNumbers();

    return Board.withArray(_cells);
  }

  void _generateAndFillMines() {
    for (final cell in mineGenerator.proposedResult) {
      final newCell = _cells.cell(cell.row, cell.column).copyWith(type: BoardCellType.mine);
      _cells.setCell(cell.row, cell.column, newCell);
    }
  }

  void _fillNumbers() {
    for (var x = 0; x < rows; x++) {
      for (var y = 0; y < columns; y++) {
        if (_cells.cell(x, y).isEmpty) {
          final count = _countMinesAround(x, y);
          final newCell = _cells.cell(x, y).copyWith(type: BoardCellType.number, number: count);
          _cells.setCell(x, y, newCell);
        }
      }
    }
  }

  int _countMinesAround(int row, int column) {
    int count = 0;
    for (var x = (row - 1); x <= (row + 1); x++) {
      for (var y = (column - 1); y <= (column + 1); y++) {
        if (x >= 0 && y >= 0 && x < rows && y < columns && _cells.cell(x, y).isMine) {
          count++;
        }
      }
    }
    return count;
  }
}
