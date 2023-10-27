import '../../base/cell.dart';

class MineCellsRegistry {
  final Map<String, Cell> _cells = {};

  void add(Cell cell) {
    final key = _createKey(cell);
    _cells[key] = cell;
  }

  bool contains(Cell cell) => _cells[_createKey(cell)] != null;

  String _createKey(Cell cell) => '${cell.row}-${cell.column}';

  int get length => _cells.values.length;

  List<Cell> toList() => _cells.values.toList();
}

class ProposedMineCell extends AbstractCell {
  const ProposedMineCell(int row, int column) : super(row, column);

  @override
  String toString() {
    return 'Cell($row, $column)';
  }
}
