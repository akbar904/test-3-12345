
import 'package:flutter/material.dart';

class TextModel {
	final String text;
	final IconData icon;

	TextModel({required this.text, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	factory TextModel.fromJson(Map<String, dynamic> json) {
		return TextModel(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (runtimeType != other.runtimeType) return false;
		final TextModel otherModel = other as TextModel;
		return text == otherModel.text && icon == otherModel.icon;
	}

	@override
	int get hashCode => text.hashCode ^ icon.hashCode;
}
