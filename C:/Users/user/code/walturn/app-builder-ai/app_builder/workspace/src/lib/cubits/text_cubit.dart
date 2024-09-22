
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:com.walturn/models/text_state.dart';

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState(text: 'Cat', icon: Icons.access_time));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextState(text: 'Dog', icon: Icons.person));
		} else {
			emit(TextState(text: 'Cat', icon: Icons.access_time));
		}
	}
}
