import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An asynchronous task required or optionally performed during app startup.
typedef AppInitializer = Future<void> Function();

/// Initializes Flutter and launches [app] inside the application's
/// provider scope.
///
/// [initializeRequired], when supplied, completes before the first app frame.
/// Its errors intentionally propagate to the caller so startup cannot silently
/// continue in a partially initialized state.
///
/// [warmUp], when supplied, starts after the first frame. Its errors are
/// reported to Flutter's error handler and do not take down the launched app.
Future<void> initApp({
  required Widget app,
  Widget Function(Widget child)? providerScopeBuilder,
  AppInitializer? initializeRequired,
  AppInitializer? warmUp,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (initializeRequired != null) {
    await initializeRequired();
  }

  if (warmUp != null) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_runOptionalWarmUp(warmUp));
    });
  }

  runApp(providerScopeBuilder?.call(app) ?? ProviderScope(child: app));
}

Future<void> _runOptionalWarmUp(AppInitializer warmUp) async {
  try {
    await warmUp();
  } on Object catch (error, stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'app bootstrap',
        context: ErrorDescription('while running optional app warm-up'),
      ),
    );
  }
}
