import 'package:flutter_test/flutter_test.dart';
import 'package:mines_game_flutter/app.dart';

void main() {
  testWidgets('Some test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MyApp());
  });
}
