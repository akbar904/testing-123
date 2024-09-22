
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.walturn/widgets/text_widget.dart';
import 'package:com.walturn/cubits/text_cubit.dart';
import 'package:com.walturn/models/text_state.dart';

// Mock TextCubit for testing
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextWidget', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('initially displays "Cat" with clock icon', (tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: TextWidget(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays "Dog" with person icon when state changes', (tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([TextState(text: 'Dog', icon: Icons.person)]),
				initialState: TextState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: TextWidget(),
					),
				),
			);

			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles text and icon on tap', (tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: TextWidget(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			verify(() => textCubit.toggleText()).called(1);
		});
	});
}
