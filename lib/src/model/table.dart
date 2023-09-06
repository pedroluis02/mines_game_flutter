import 'table_cell.dart';

class TableModel {
  final int rows;
  final int columns;

  late final List<List<TableCellModel>> _cells;

  int get size => (rows * columns);

  TableModel(this.rows, this.columns) : _cells = _createCells(rows, columns);

  TableCellModel cell(int row, int column) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    assert(column >= 0 && column < columns, '$columns should be between 0 and ${columns - 1}');

    return _cells[row][column];
  }

  List<TableCellModel> allRow(int row) {
    assert(row >= 0 && row < rows, '$row should be between 0 and ${rows - 1}');
    return _cells[row];
  }

  static List<List<TableCellModel>> _createCells(int rows, int columns) {
    return List.generate(
      rows,
      (row) => List.generate(columns, (column) => TableCellModel(row, column)).toList(),
    ).toList();
  }
}

class TableModelOfBoard extends TableModel {
  TableModelOfBoard(int sideLength) : super(sideLength, sideLength);
}
