import 'board_cell.dart';
import 'board_cells.dart';

class Board {
  final BoardCellArray _cells;

  int get size => (rows * columns);

  int get rows => _cells.rows;

  int get columns => _cells.columns;

  Board(int rows, int columns) : _cells = BoardCellArray(rows, columns);

  const Board.withArray(BoardCellArray cells) : _cells = cells;

  BoardCell cell(int row, int column) => _cells.cell(row, column);

  List<BoardCell> rowCells(int row) => _cells.rowCells(row);
}
