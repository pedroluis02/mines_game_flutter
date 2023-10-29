import 'dart:math' as math;

import '../../base/cell.dart';
import '../../base/dimension.dart';
import 'mine_number_calculator.dart';
import 'mine_registry.dart';

abstract class MineGenerator {
  final Dimension dimension;
  final MineNumberCalculator lengthCalculator;

  const MineGenerator(this.dimension, this.lengthCalculator);

  int get proposedLength;

  List<Cell> get proposedResult;
}

class DefaultMineGenerator extends MineGenerator {
  final _random = math.Random();
  final _registry = MineCellsRegistry();

  DefaultMineGenerator(Dimension dimension, {MineNumberCalculator? lengthCalculator})
      : super(dimension, lengthCalculator ?? MinesNumberByPercentage(20.0)) {
    _populate();
  }

  @override
  int get proposedLength => _registry.length;

  @override
  List<Cell> get proposedResult => _registry.toList();

  void _populate() {
    int length = lengthCalculator.compute(dimension);
    int count = 0;

    while (count < length) {
      final cell = _nextProposedCell();
      if (!_registry.contains(cell)) {
        _registry.add(cell);
        count++;
      }
    }
  }

  Cell _nextProposedCell() {
    final row = _nextValueInsideOf(0, dimension.rows - 1);
    final column = _nextValueInsideOf(0, dimension.columns - 1);
    return Cell.crate(row, column);
  }

  int _nextValueInsideOf(int min, int max) {
    return (_random.nextDouble() * (max - min + 1)).floor() + min;
  }
}
