import 'dart:math' as math;

import '../../base/cell.dart';
import 'mine_registry.dart';

class MineGenerator {
  static const _percentageOfMines = 20.0;

  final int rows;
  final int columns;

  final _random = math.Random();
  final _registry = MineCellsRegistry();

  int _count = 0;

  MineGenerator(this.rows, this.columns) {
    _count = _calculateLength();
    _populate();
  }

  int get count => _count;

  List<Cell> get cells => _registry.toList();

  void _populate() {
    int currentLength = 0;
    while (currentLength < count) {
      final cell = _nextProposedCell();
      if (!_registry.contains(cell)) {
        _registry.add(cell);
        currentLength++;
      }
    }
  }

  int _calculateLength() {
    return ((_percentageOfMines / 100) * (rows * columns)).floor();
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
