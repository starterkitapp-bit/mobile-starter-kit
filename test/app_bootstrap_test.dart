import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter_kit/app/bootstrap/app_bootstrap.dart';

void main() {
  testWidgets(
    'awaits required initialization and launches inside ProviderScope',
    (tester) async {
      final events = <String>[];

      await initApp(
        app: Consumer(
          builder: (context, ref, child) {
            events.add('app');
            return const Directionality(
              textDirection: TextDirection.ltr,
              child: Text('provider scope available'),
            );
          },
        ),
        initializeRequired: () async {
          events.add('required');
        },
      );

      expect(events, ['required']);

      await tester.pump();

      expect(events, ['required', 'app']);
      expect(find.text('provider scope available'), findsOneWidget);
    },
  );

  testWidgets('starts optional warm-up after the first frame', (tester) async {
    final events = <String>[];

    await initApp(
      app: const SizedBox.shrink(),
      warmUp: () async {
        events.add('warm-up');
      },
    );

    expect(events, isEmpty);

    await tester.pump();

    expect(events, ['warm-up']);
  });

  testWidgets('propagates required initialization failures', (tester) async {
    await expectLater(
      initApp(
        app: const SizedBox.shrink(),
        initializeRequired: () async {
          throw StateError('required initialization failed');
        },
      ),
      throwsA(isA<StateError>()),
    );
  });

  testWidgets('reports optional warm-up failures to Flutter', (tester) async {
    final reportedError = Completer<FlutterErrorDetails>();
    final previousHandler = FlutterError.onError;
    FlutterError.onError = reportedError.complete;
    addTearDown(() {
      FlutterError.onError = previousHandler;
    });

    await initApp(
      app: const SizedBox.shrink(),
      warmUp: () async {
        throw StateError('optional warm-up failed');
      },
    );

    await tester.pump();

    final details = await reportedError.future;
    expect(details.exception, isA<StateError>());
    expect(details.library, 'app bootstrap');
  });
}
