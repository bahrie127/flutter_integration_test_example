import 'package:flutter/material.dart';
import 'package:flutter_integration_test_example/home_page.dart';
import 'package:flutter_integration_test_example/main.dart';
import 'package:flutter_integration_test_example/result_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('error when no input text and go to next result page',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MyApp());
    //act
    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();
    //assert
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(ResultPage), findsNothing);
    expect(find.text('Input at least one character'), findsOneWidget);
  });
// }

  testWidgets(
      'after input a text, go to the result page,'
      'and when click back button home page input text should be clear',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());

    const inputText = 'Hello All';
    await widgetTester.enterText(
      find.byKey(const Key('input-text-field')),
      inputText,
    );
    await Future.delayed(const Duration(seconds: 2));
    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();

    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(ResultPage), findsOneWidget);
    expect(find.text(inputText), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
    await widgetTester.tap(find.byType(BackButton));
    await widgetTester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(ResultPage), findsNothing);
    expect(find.text(inputText), findsNothing);
  });
}
