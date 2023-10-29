import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/base/cell.dart';
import 'package:mines_game_flutter/src/base/dimension.dart';
import 'package:mines_game_flutter/src/model/models.dart';
import 'package:parameterized_test/parameterized_test.dart';

import 'boundary_board_values.dart';

void main() {
  group('Board', () {
    final dimension = Dimension.create(6, 5);

    final inBoundaryValues = BoundaryBoardValues.inside(dimension);
    final outBoundaryValues = BoundaryBoardValues.outside(dimension);

    late final Board model;

    setUpAll(() => model = Board(dimension));

    test('size should be dimension size', () {
      expect(model.size, dimension.size);
    });

    parameterizedTest(
      'out cell boundary values should return assertion error',
      outBoundaryValues.cellSamples(),
      p2((int row, int column) {
        expect(() => model.cell(Cell.crate(row, column)), throwsAssertionError);
      }),
    );

    parameterizedTest(
      'out each row boundary values should return assertion error',
      outBoundaryValues.rowSamples(),
      p1((int row) {
        expect(() => model.rowCells(row), throwsAssertionError);
      }),
    );

    parameterizedTest(
      'should get cell by row and cell index',
      inBoundaryValues.cellSamples(),
      p2((int row, int column) {
        final boardCell = model.cell(Cell.crate(row, column));
        expect(dimension.hasCell(boardCell), true);
      }),
    );

    parameterizedTest(
      'all row values should get by row index',
      inBoundaryValues.rowSamples(),
      p1((int row) {
        final allRow = model.rowCells(row);
        expect(allRow.length, dimension.columns);
      }),
    );
  });
}
