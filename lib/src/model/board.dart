import '../base/cell.dart';
import '../base/dimension.dart';
import 'board_cell.dart';
import 'board_cells.dart';

class Board {
  final BoardCellArray _cells;

  int get size => _cells.dimension.size;

  int get rows => _cells.dimension.rows;

  int get columns => _cells.dimension.columns;

  Board(Dimension dimension) : _cells = BoardCellArray(dimension);

  const Board.withArray(BoardCellArray cells) : _cells = cells;

  BoardCell cell(Cell cell) => _cells.cell(cell);

  List<BoardCell> rowCells(int row) => _cells.rowCells(row);
}
