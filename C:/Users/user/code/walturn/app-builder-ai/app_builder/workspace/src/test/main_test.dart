
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/main.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('Main App Tests', () {
		late TextCubit mockTextCubit;

		setUp(() {
			mockTextCubit = MockTextCubit();
		});

		testWidgets('App shows initial Cat text with clock icon', (WidgetTester tester) async {
			when(() => mockTextCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: mockTextCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('App shows Dog text with person icon when text is tapped', (WidgetTester tester) async {
			whenListen(
				mockTextCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.access_time),
					TextState(text: 'Dog', icon: Icons.person),
				]),
			);
			when(() => mockTextCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: mockTextCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
