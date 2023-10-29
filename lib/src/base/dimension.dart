import 'cell.dart';

abstract class Dimension {
  int get rows;

  int get columns;

  int get size;

  bool hasCell(Cell cell);

  bool hasRow(int row);

  bool hasColumn(int column);

  factory Dimension.create(int rows, int columns) => _SimpleDimension(rows, columns);
}

class _SimpleDimension implements Dimension {
  final int _rows;
  final int _columns;

  const _SimpleDimension(int rows, int columns)
      : _rows = rows,
        _columns = columns;

  @override
  int get size => (rows * columns);

  @override
  int get rows => _rows;

  @override
  int get columns => _columns;

  @override
  bool hasCell(Cell cell) => (hasRow(cell.row) && hasColumn(cell.column));

  @override
  bool hasRow(int row) => (row >= 0 && row < rows);

  @override
  bool hasColumn(int column) => (column >= 0 && column < columns);
}
