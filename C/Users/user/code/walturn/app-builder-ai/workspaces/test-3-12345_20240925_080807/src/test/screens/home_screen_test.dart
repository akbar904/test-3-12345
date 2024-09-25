
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_text_switcher/screens/home_screen.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('should display initial text as "Cat" with clock icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MaterialApp(home: HomeScreen()),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('should toggle text to "Dog" with person icon when tapped', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextModel(text: 'Cat', icon: Icons.access_time),
					TextModel(text: 'Dog', icon: Icons.person),
				]),
				initialState: TextModel(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MaterialApp(home: HomeScreen()),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
