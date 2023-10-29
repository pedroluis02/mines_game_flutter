import '../base/dimension.dart';
import 'board.dart';

class SquareBoard extends Board {
  SquareBoard(int sideLength) : super(Dimension.create(sideLength, sideLength));
}
