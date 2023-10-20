import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_generator.dart';

void main() {
  group('MinesGenerator', () {
    const rows = 6;
    const columns = 6;
    late final MineGenerator generator;

    setUpAll(() => generator = MineGenerator(rows, columns));

    test('count should be length of cells', () {
      final cells = generator.cells;
      expect(generator.count, cells.length);
    });

    test('each cell should be inside range', () {
      final cells = generator.cells;
      for (final cell in cells) {
        expect(_isInRangeFromOToMax(cell.row, rows), true);
        expect(_isInRangeFromOToMax(cell.column, columns), true);
      }
    });
  });
}

bool _isInRangeFromOToMax(int value, int max) {
  return (value >= 0) && (value <= max - 1);
}
