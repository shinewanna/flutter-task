import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/widgets/custom_textfield.dart';
import 'package:flutter_task/app/routes/app_pages.dart';
import 'package:flutter_task/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Widget Test', () {
    testWidgets('Initial Screen', (tester) async {
      AppPages.INITIAL = Routes.HOME;
      await tester.pumpWidget(PrePage());
      await tester.pump();
      expect(find.byType(FlutterLogo), findsOneWidget);
      //* Check API section button and Task section button
      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('API Section', (tester) async {
      AppPages.INITIAL = Routes.API_SECTION;
      await tester.runAsync(() async {
        await tester.pumpWidget(PrePage());
        await tester.pump();
        expect(find.byType(CustomTextField), findsOneWidget);
        //* Check API section button and Task section button
        expect(find.text('Search'), findsOneWidget);
      });
    });
  });
}
