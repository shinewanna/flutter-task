import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_login/src/widgets/animated_button.dart';
import 'package:flutter_login/src/widgets/animated_text_form_field.dart';
import 'package:flutter_task/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Task Section Test', (tester) async {
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 1));
    final navigateTaskSectionButton = find.byType(ElevatedButton).at(1);
    await tester.tap(navigateTaskSectionButton);
    await tester.pumpAndSettle(Duration(seconds: 1));
    final emailForm = find.byType(AnimatedTextFormField).first;
    final passwordForm = find.byType(AnimatedPasswordTextFormField).first;
    final loginButton = find.byType(AnimatedButton).first;
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    //* Validate expect
    expect(find.text('Password is too short!'), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.enterText(emailForm, 'shinewanna97@gmail.com');
    await tester.pumpAndSettle();
    await tester.enterText(passwordForm, '12345678');
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    //* Check context is navigate to Home page
    expect(find.byTooltip('Add Tasks'), findsOneWidget);

    final navigateToAddTaskPageButton = find.byTooltip('Add Tasks');
    await tester.tap(navigateToAddTaskPageButton);
    await tester.pumpAndSettle();
    final uploadTaskButton = find.byType(ElevatedButton);
    await tester.tap(uploadTaskButton);
    await tester.pumpAndSettle();
    //* Validate expect
    expect(find.text('Field can not be empty'), findsOneWidget);

    final taskForm = find.byType(TextFormField).first;
    final text = 'Take the car key';
    await tester.enterText(taskForm, text);
    await tester.pumpAndSettle();
    await tester.tap(uploadTaskButton);
    await tester.pumpAndSettle();
    //* After upload new task, that task have to find in tasks view
    expect(find.text(text), findsWidgets);
    //* Make Complete
    final updateButton = find.byIcon(Icons.edit).first;
    await tester.tap(updateButton);
    await tester.tap(find.text('Complete').last);
    await tester.tap(updateButton);
    await tester.pumpAndSettle();
    //* Delete
    await tester.tap(find.text('Delete').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();
    await tester.tap(updateButton);
    await tester.pumpAndSettle();
    //* Edit
    await tester.tap(find.text('Edit').last);
    await tester.pumpAndSettle();
    final editText = 'Sleep, Eat, Code';
    await tester.enterText(taskForm, editText);
    await tester.pumpAndSettle();
    await tester.tap(uploadTaskButton);
    await tester.pumpAndSettle();
    //* Check edited text found
    expect(find.text(editText), findsWidgets);

    final signOutButton = find.byIcon(Icons.logout);
    await tester.tap(signOutButton);
    await tester.pumpAndSettle();
    final alertOkButton = find.text('Ok');
    await tester.tap(alertOkButton);
    await tester.pumpAndSettle(Duration(seconds: 1));
    //* Check context is navigate to Login page
    expect(find.text('Task'), findsOneWidget);
  });
}
