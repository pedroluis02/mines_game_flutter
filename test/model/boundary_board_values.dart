import 'package:mines_game_flutter/src/base/dimension.dart';

abstract class BoundaryBoardValues {
  final Dimension dimension;

  const BoundaryBoardValues(this.dimension);

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

  factory BoundaryBoardValues.inside(Dimension dimension) {
    return _InsideBoundaryBoardValues(dimension);
  }

  factory BoundaryBoardValues.outside(Dimension dimension) {
    return _OutsideBoundaryBoardValues(dimension);
  }
}

class _InsideBoundaryBoardValues extends BoundaryBoardValues {
  const _InsideBoundaryBoardValues(super.dimension);

  @override
  int get minRow => 0;

  @override
  int get minColumn => 0;

  @override
  int get maxRow => (dimension.rows - 1);

  @override
  int get maxColumn => (dimension.columns - 1);
}

class _OutsideBoundaryBoardValues extends BoundaryBoardValues {
  const _OutsideBoundaryBoardValues(super.dimension);

  @override
  int get minRow => -1;

  @override
  int get minColumn => -1;

  @override
  int get maxRow => dimension.rows;

  @override
  int get maxColumn => dimension.columns;
}
