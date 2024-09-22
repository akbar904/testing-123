
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/models/text_state.dart';

class MockTextState extends Mock implements TextState {}

void main() {
	group('TextState Model Tests', () {
		test('TextState should be initialized with correct values', () {
			final textState = TextState(text: 'Cat', icon: Icons.access_time);

			expect(textState.text, 'Cat');
			expect(textState.icon, Icons.access_time);
		});

		test('TextState should serialize and deserialize correctly', () {
			final textState = TextState(text: 'Cat', icon: Icons.access_time);
			final textStateJson = {'text': 'Cat', 'icon': Icons.access_time.codePoint};

			expect(textState.toJson(), textStateJson);
			expect(TextState.fromJson(textStateJson).text, 'Cat');
			expect(TextState.fromJson(textStateJson).icon, Icons.access_time);
		});
	});
}

// Assuming the TextState class has these methods for serialization/deserialization:
extension TextStateJson on TextState {
	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	static TextState fromJson(Map<String, dynamic> json) {
		return TextState(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
