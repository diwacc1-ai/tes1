import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tes1/main.dart';

void main() {
  testWidgets('Calculator screen shows two inputs and operations', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Angka 1'), findsOneWidget);
    expect(find.text('Angka 2'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '12');
    await tester.enterText(find.byType(TextField).at(1), '3');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Hasil: 15'), findsOneWidget);
  });
}
