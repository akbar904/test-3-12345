
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_text_switcher/cubit/text_cubit.dart';
import 'package:simple_text_switcher/models/text_model.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextModel with text "Cat" and icon of Icons.pets', () {
			expect(textCubit.state, TextModel(text: 'Cat', icon: Icons.pets));
		});

		blocTest<TextCubit, TextModel>(
			'emits TextModel with text "Dog" and icon of Icons.person when toggleText is called',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextModel(text: 'Dog', icon: Icons.person)],
		);

		blocTest<TextCubit, TextModel>(
			'emits TextModel with text "Cat" and icon of Icons.pets when toggleText is called twice',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [
				TextModel(text: 'Dog', icon: Icons.person),
				TextModel(text: 'Cat', icon: Icons.pets),
			],
		);
	});
}
