import '../base/cell.dart';
import '../base/dimension.dart';
import '../model/models.dart';
import 'mine_generator/mine_generator.dart';

class BoardCreator {
  final Dimension dimension;
  final MineGenerator mineGenerator;

  final BoardCellArray _cells;

  BoardCreator(this.dimension, {MineGenerator? mineGenerator})
      : mineGenerator = mineGenerator ?? DefaultMineGenerator(dimension),
        _cells = BoardCellArray(dimension);

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
    for (var x = 0; x < dimension.rows; x++) {
      for (var y = 0; y < dimension.columns; y++) {
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
        final neighborCell = Cell.crate(x, y);
        if (dimension.hasCell(neighborCell) && _cells.cell(neighborCell).isMine) {
          count++;
        }
      }
    }
    return count;
  }
}
