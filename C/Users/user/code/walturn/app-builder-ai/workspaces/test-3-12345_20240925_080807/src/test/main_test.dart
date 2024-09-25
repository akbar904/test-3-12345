
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_text_switcher/main.dart';

void main() {
	group('MyApp', () {
		testWidgets('should build MaterialApp with TextCubit and HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			
			// Verify that MaterialApp is present
			expect(find.byType(MaterialApp), findsOneWidget);
			
			// Verify that HomeScreen is present
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
