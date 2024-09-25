
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_text_switcher/widgets/text_switcher_widget.dart';
import 'package:com.example.simple_text_switcher/cubit/text_cubit.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextSwitcherWidget', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.pets));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: TextSwitcherWidget(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('toggles text and icon when tapped', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.pets),
					TextState(text: 'Dog', icon: Icons.person),
				]),
			);
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.pets));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: TextSwitcherWidget(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
