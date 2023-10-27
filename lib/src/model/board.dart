import 'board_cell.dart';

typedef BoardCellArray = List<List<BoardCell>>;

class Board {
  final int _rows;
  final int _columns;
  final BoardCellArray _cells;

  int get size => (rows * columns);

  int get rows => _rows;

  int get columns => _columns;

  Board(int rows, int columns)
      : assert(rows > 0),
        assert(columns > 0),
        _rows = rows,
        _columns = columns,
        _cells = Board.createCells(rows, columns);

  Board.withArray(BoardCellArray cells)
      : assert(cells.isNotEmpty),
        assert(cells[0].isNotEmpty),
        _rows = cells.length,
        _columns = cells[0].length,
        _cells = cells;

  BoardCell cell(int row, int column) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    assert(column >= 0 && column < columns, '$columns should be between 0 and ${columns - 1}');

    return _cells[row][column];
  }

  List<BoardCell> rowCells(int row) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    return _cells[row];
  }

  static List<List<BoardCell>> createCells(int rows, int columns) {
    return List.generate(
      rows,
      (row) => List.generate(
        columns,
        (column) => BoardCell(row, column),
      ).toList(),
    ).toList();
  }
}
