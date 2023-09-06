class TableCellModel {
  final int row;
  final int column;
  final bool state;

  const TableCellModel(this.row, this.column, {this.state = false});

  @override
  String toString() {
    return 'TableCellModel[$row, $column]';
  }
}
