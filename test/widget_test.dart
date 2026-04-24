import 'package:counterapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construir la app
    await tester.pumpWidget(const MyApp());

    // Verificar que inicia en 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap al botón de sumar (tu icono real)
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    // Verificar que incrementó
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
