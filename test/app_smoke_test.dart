import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter_kit/app/app.dart';

void main() {
  testWidgets('renders the starter application', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Mobile Starter Kit'), findsOneWidget);
  });
}
