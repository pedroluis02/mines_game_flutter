import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_generator.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_number_calculator.dart';

void main() {
  group('MinesGenerator', () {
    const rows = 6;
    const columns = 6;

    late final MineNumberCalculator lengthCalculator;
    late final MineGenerator generator;

    setUpAll(() {
      lengthCalculator = MinesNumberByPercentage(20.0);
      generator = MineGenerator(rows, columns, lengthCalculator: lengthCalculator);
    });

    test('count should be length of cells', () {
      final length = lengthCalculator.compute(rows, columns);
      expect(generator.length, length);
    });

    test('each cell should be inside range', () {
      final result = generator.proposedResult;
      for (final cell in result) {
        expect(_isInRangeFromOToMax(cell.row, rows), true);
        expect(_isInRangeFromOToMax(cell.column, columns), true);
      }
    });
  });
}

bool _isInRangeFromOToMax(int value, int max) {
  return (value >= 0) && (value <= max - 1);
}
