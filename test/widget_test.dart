import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/main.dart';

void main() {
  testWidgets('Some test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
