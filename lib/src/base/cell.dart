abstract class Cell {
  int get row;

  int get column;
}

abstract class AbstractCell implements Cell {
  final int _row;
  final int _column;

  const AbstractCell(int row, int column)
      : _row = row,
        _column = column;

  @override
  int get row => _row;

  @override
  int get column => _column;
}
