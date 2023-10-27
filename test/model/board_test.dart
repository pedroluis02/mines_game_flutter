import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/model/models.dart';
import 'package:parameterized_test/parameterized_test.dart';

import 'boundary_board_values.dart';

void main() {
  group('Board', () {
    const rows = 4;
    const columns = 4;

    final inBoundaryValues = BoundaryBoardValues.inside(rows, columns);
    final outBoundaryValues = BoundaryBoardValues.outside(rows, columns);

    late final Board model;

    setUpAll(() => model = Board(rows, columns));

    test('size should be (rows * columns)', () {
      expect(model.size, rows * columns);
    });

    parameterizedTest(
      'out cell boundary values should return assertion error',
      outBoundaryValues.cellSamples(),
      p2((int row, int column) {
        expect(() => model.cell(row, column), throwsAssertionError);
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
        final cell = model.cell(row, column);
        expect(cell.row, row);
        expect(cell.column, column);
      }),
    );

    parameterizedTest(
      'all row values should get by row index',
      inBoundaryValues.rowSamples(),
      p1((int row) {
        final allRow = model.rowCells(row);
        expect(allRow.length, rows);
      }),
    );
  });
}
