
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_text_switcher/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('should be initialized with given text and icon', () {
			final textModel = TextModel(text: 'Cat', icon: Icons.pets);
			expect(textModel.text, 'Cat');
			expect(textModel.icon, Icons.pets);
		});

		test('should correctly serialize to JSON', () {
			final textModel = TextModel(text: 'Cat', icon: Icons.pets);
			final json = textModel.toJson();
			expect(json['text'], 'Cat');
			expect(json['icon'], Icons.pets.codePoint);
		});

		test('should correctly deserialize from JSON', () {
			final json = {'text': 'Dog', 'icon': Icons.person.codePoint};
			final textModel = TextModel.fromJson(json);
			expect(textModel.text, 'Dog');
			expect(textModel.icon, Icons.person);
		});

		test('should support value equality', () {
			final textModel1 = TextModel(text: 'Cat', icon: Icons.pets);
			final textModel2 = TextModel(text: 'Cat', icon: Icons.pets);
			expect(textModel1, textModel2);
		});

		test('should have a correct hashCode', () {
			final textModel = TextModel(text: 'Cat', icon: Icons.pets);
			expect(textModel.hashCode, textModel.text.hashCode ^ textModel.icon.hashCode);
		});
	});
}
