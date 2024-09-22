
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/text_cubit.dart';
import '../models/text_state.dart';

class TextWidget extends StatelessWidget {
	const TextWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, TextState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () {
						context.read<TextCubit>().toggleText();
					},
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.text),
							SizedBox(width: 8),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
