
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/text_cubit.dart';
import 'widgets/text_widget.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Cubit Example',
			home: BlocProvider(
				create: (_) => TextCubit(),
				child: Scaffold(
					appBar: AppBar(
						title: Text('Cubit Example'),
					),
					body: Center(
						child: TextWidget(),
					),
				),
			),
		);
	}
}
