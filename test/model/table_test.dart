import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/src/model/table.dart';

void main() {
  group('table model creation', () {
    const sideLength = 4;
    late final TableModelOfBoard model;

    setUpAll(() => model = TableModelOfBoard(sideLength));

    test('check size', () {
      const wanted = 16;
      expect(model.size, wanted);
    });

    test('obtain cell by row and column', () {
      const wantedRow = 3;
      const wantedColumn = 3;

      final cell = model.cell(wantedRow, wantedColumn);
      expect(cell.row, wantedRow);
      expect(cell.column, wantedColumn);
    });

    test('obtain all cells of row by row index', () {
      const wantedRow = 3;

      final allRow = model.allRow(wantedRow);
      expect(allRow.length, sideLength);
    });
  });
}
