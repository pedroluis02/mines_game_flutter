import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/base/cell.dart';
import 'package:mines_game_flutter/src/base/dimension.dart';
import 'package:mines_game_flutter/src/game/board_creator.dart';
import 'package:mines_game_flutter/src/game/mine_generator/mine_generator.dart';
import 'package:mines_game_flutter/src/model/board.dart';

void main() {
  group('BoardGenerator', () {
    final dimension = Dimension.create(6, 5);

    late final BoardCreator creator;
    late final MineGenerator mineGenerator;
    late final Board board;

    setUpAll(() {
      mineGenerator = DefaultMineGenerator(dimension);
      creator = BoardCreator(dimension, mineGenerator: mineGenerator);
      board = creator.create();
    });

    test('size should be dimension size', () {
      final board = creator.create();
      expect(board.size, dimension.size);
    });

    test('mines number should equals generator', () {
      expect(_countMinesOfBoard(board), mineGenerator.proposedLength);
    });
  });
}

int _countMinesOfBoard(Board board) {
  int count = 0;
  for (var x = 0; x < board.rows; x++) {
    for (var y = 0; y < board.columns; y++) {
      final cell = Cell.crate(x, y);
      if (board.cell(cell).isMine) {
        count++;
      }
    }
  }
  return count;
}
