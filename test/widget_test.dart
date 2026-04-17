import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petty/app.dart';

void main() {
  testWidgets('Petty app renders splash title', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: PettyApp()));
    expect(find.text('Petty'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
