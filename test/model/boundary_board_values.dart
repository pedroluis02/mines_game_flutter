abstract class BoundaryBoardValues {
  final int rows;
  final int columns;

  const BoundaryBoardValues(this.rows, this.columns);

  int get minRow;

  int get minColumn;

  int get maxRow;

  int get maxColumn;

  List<List<int>> cellSamples() {
    return [
      [minRow, minColumn],
      [minRow, maxColumn],
      [maxRow, minColumn],
      [maxRow, maxColumn],
    ];
  }

  List<List<int>> rowSamples() {
    return [
      [minRow],
      [maxRow],
    ];
  }

  factory BoundaryBoardValues.inside(int rows, int columns) {
    return _InsideBoundaryBoardValues(rows, columns);
  }

  factory BoundaryBoardValues.outside(int rows, int columns) {
    return _OutsideBoundaryBoardValues(rows, columns);
  }
}

class _InsideBoundaryBoardValues extends BoundaryBoardValues {
  const _InsideBoundaryBoardValues(super.rows, super.columns);

  @override
  int get minRow => 0;

  @override
  int get minColumn => 0;

  @override
  int get maxRow => (rows - 1);

  @override
  int get maxColumn => (columns - 1);
}

class _OutsideBoundaryBoardValues extends BoundaryBoardValues {
  const _OutsideBoundaryBoardValues(super.rows, super.columns);

  @override
  int get minRow => -1;

  @override
  int get minColumn => -1;

  @override
  int get maxRow => rows;

  @override
  int get maxColumn => columns;
}
