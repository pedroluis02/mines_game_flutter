import 'dart:math' as math;

import '../../base/cell.dart';
import 'mine_number_calculator.dart';
import 'mine_registry.dart';

class MineGenerator {
  final int rows;
  final int columns;

  late final MineNumberCalculator _lengthCalculator;

  final _random = math.Random();
  final _registry = MineCellsRegistry();

  MineGenerator(
    this.rows,
    this.columns, {
    MineNumberCalculator? lengthCalculator,
  }) {
    _lengthCalculator = lengthCalculator ?? MinesNumberByPercentage(20.0);
    _populate();
  }

  int get length => proposedResult.length;

  List<Cell> get proposedResult => _registry.toList();

  void _populate() {
    int length = _lengthCalculator.compute(rows, columns);
    int count = 0;

    while (count < length) {
      final cell = _nextProposedCell();
      if (!_registry.contains(cell)) {
        _registry.add(cell);
        count++;
      }
    }
  }

  ProposedMineCell _nextProposedCell() {
    final row = _nextValueInsideOf(0, rows - 1);
    final column = _nextValueInsideOf(0, columns - 1);
    return ProposedMineCell(row, column);
  }

  int _nextValueInsideOf(int min, int max) {
    return (_random.nextDouble() * (max - min + 1)).floor() + min;
  }
}
