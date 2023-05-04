import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nerdy_calculator/main.dart';
import 'package:nerdy_calculator/screens/calculator_screen/calculator_screen_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    addTearDown(binding.window.clearPhysicalSizeTestValue);
  });
  // test('see if all buttons are on screen'

  testWidgets('test to see all non advanced buttons are on screen',
      (tester) async {
    binding.window.physicalSizeTestValue = const Size(480, 800);
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        child: const MaterialApp(home: NerdyCalculator())));
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('.'), findsOneWidget);
    expect(find.text('CE'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('+/-'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
  });

  testWidgets('test to see if all advanced buttons are on screen',
      (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        child: const MaterialApp(home: NerdyCalculator())));

    binding.window.physicalSizeTestValue = const Size(800, 1200);

    //addTearDown(binding.window.clearPhysicalSizeTestValue);
    expect(find.text('x^X'), findsOneWidget);
    expect(find.text('sin'), findsOneWidget);
    expect(find.text('cos'), findsOneWidget);
    expect(find.text('tan'), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
  });

  testWidgets('calculate 5+4-3', (widgetTester) async {
    await widgetTester.pumpWidget(ChangeNotifierProvider(
        create: (_) => CalculatorViewModel(),
        child: const MaterialApp(home: NerdyCalculator())));
    await widgetTester.tap(find.text('5'));
    await widgetTester.tap(find.text('+'));
    await widgetTester.tap(find.text('4'));
    await widgetTester.tap(find.text('-'));
    await widgetTester.tap(find.text('3'));
    await widgetTester.tap(find.text('='));
    expect(find.text('6'), findsOneWidget);
  });
}
