import 'package:flutter_test/flutter_test.dart';
import 'package:tabungku/main.dart';

void main() {
  testWidgets('Tabungku app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TabungkuApp());

    expect(find.text('Tabungku'), findsOneWidget);
  });
}