abstract class Cell {
  int get row;

  int get column;

  factory Cell.crate(int row, int column) => _SimpleCell(row, column);
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

class _SimpleCell extends AbstractCell {
  const _SimpleCell(int row, int column) : super(row, column);

  @override
  String toString() {
    return 'Cell($row, $column)';
  }
}
