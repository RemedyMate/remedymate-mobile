import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:remedy_mate/features/chatbot/domain/entities/guide_entity.dart';
import 'package:remedy_mate/features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'package:remedy_mate/features/chatbot/presentation/pages/chat.dart';

class MockChatbotBloc extends MockBloc<ChatbotEvent, ChatbotState>
    implements ChatbotBloc {}

void main() {
  late MockChatbotBloc mockBloc;

  setUpAll(() {
    mockBloc = MockChatbotBloc();
    registerFallbackValue(StartChatEvent('', ''));
    registerFallbackValue(ChatbotInitial());
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<ChatbotBloc>.value(
        value: mockBloc,
        child: child,
      ),
    );
  }

  group('SymptomCheckerPage Widget Tests', () {
    testWidgets('shows initial greeting when state is ChatbotInitial',
        (tester) async {
      when(() => mockBloc.state).thenReturn(ChatbotInitial());

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      expect(find.textContaining('I’m RemedyMate'), findsOneWidget);
    });

    testWidgets('shows loading indicator when state is ChatbotLoading',
        (tester) async {
      when(() => mockBloc.state).thenReturn(ChatbotLoading());

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows follow-up question when state is FollowUpLoaded',
        (tester) async {
      when(() => mockBloc.state)
          .thenReturn(FollowUpLoaded('What is your pain level?', '123'));

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      expect(find.text('What is your pain level?'), findsOneWidget);
    });

    testWidgets('shows guidance card when state is GuideLoaded',
        (tester) async {
      const guide = GuideEntity(
        flag: 'GREEN',
        selfCare: ['Rest', 'Drink water'],
        otc: ['Paracetamol'],
        medical: ['If symptoms worsen'],
      );

      when(() => mockBloc.state).thenReturn(GuideLoaded(guide));

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      expect(find.text('✔ Self-Care Steps'), findsOneWidget);
      expect(find.text('Rest'), findsOneWidget);
    });

    testWidgets('shows error message when state is ChatbotError',
        (tester) async {
      when(() => mockBloc.state)
          .thenReturn(ChatbotError('Something went wrong'));

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('quick chip appends text into input field', (tester) async {
      when(() => mockBloc.state).thenReturn(ChatbotInitial());

      await tester.pumpWidget(makeTestableWidget(const SymptomCheckerPage()));

      final chip = find.text('Today');
      await tester.tap(chip);
      await tester.pump();

      expect(find.widgetWithText(TextField, 'Today'), findsOneWidget);
    });
  });
}

