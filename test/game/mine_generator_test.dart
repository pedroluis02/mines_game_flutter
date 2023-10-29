import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/base/dimension.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_generator.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_number_calculator.dart';

void main() {
  group('MinesGenerator', () {
    final dimension = Dimension.create(6, 5);

    late final MineNumberCalculator lengthCalculator;
    late final DefaultMineGenerator generator;

    setUpAll(() {
      lengthCalculator = MinesNumberByPercentage(20.0);
      generator = DefaultMineGenerator(dimension, lengthCalculator: lengthCalculator);
    });

    test('count should be length of cells', () {
      final length = lengthCalculator.compute(dimension);
      expect(generator.proposedLength, length);
    });

    test('each cell should be inside range', () {
      final result = generator.proposedResult;
      for (final cell in result) {
        expect(dimension.hasCell(cell), true);
      }
    });
  });
}
