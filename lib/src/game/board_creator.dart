import 'package:mines_game_flutter/src/base/cell.dart';

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
      final newCell = _cells.cell(cell).copyWith(type: BoardCellType.mine);
      _cells.setCell(newCell);
    }
  }

  void _fillNumbers() {
    for (var x = 0; x < rows; x++) {
      for (var y = 0; y < columns; y++) {
        final cell = Cell.crate(x, y);
        if (_cells.cell(cell).isEmpty) {
          final count = _countMinesAround(cell);
          final newCell = _cells.cell(cell).copyWith(type: BoardCellType.number, number: count);
          _cells.setCell(newCell);
        }
      }
    }
  }

  int _countMinesAround(Cell cell) {
    int count = 0;
    for (var x = (cell.row - 1); x <= (cell.row + 1); x++) {
      for (var y = (cell.column - 1); y <= (cell.column + 1); y++) {
        if (x >= 0 && y >= 0 && x < rows && y < columns && _cells.cell(Cell.crate(x, y)).isMine) {
          count++;
        }
      }
    }
    return count;
  }
}
