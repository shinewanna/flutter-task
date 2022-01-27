import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/widgets/custom_textfield.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_task/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('API Section Test', (tester) async {
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 1));
    final navigateApiSectionButton = find.byType(ElevatedButton).first;
    await tester.tap(navigateApiSectionButton);
    await tester.pumpAndSettle(Duration(seconds: 1));
    //* Check Valentin is found
    expect(find.text('ValentinOrtega'), findsOneWidget);
    final searchField = find.byType(CustomTextField).first;
    await tester.enterText(searchField, 'Elisa');
    await tester.pumpAndSettle(Duration(seconds: 1));
  });
}
