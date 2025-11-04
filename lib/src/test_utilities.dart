import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test utilities for common testing scenarios
class TestUtilities {
  TestUtilities._(); // Prevent instantiation

  /// Creates a test app with the given widget
  static Widget createTestApp(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  /// Creates a test app with a custom theme
  static Widget createTestAppWithTheme(Widget child, ThemeData theme) =>
      MaterialApp(
        theme: theme,
        home: Scaffold(body: child),
      );

  /// Waits for a condition to become true
  static Future<void> waitForCondition(
    bool Function() condition, {
    Duration timeout = const Duration(seconds: 30),
    Duration pollInterval = const Duration(milliseconds: 100),
  }) async {
    final DateTime startTime = DateTime.now();
    while (!condition()) {
      if (DateTime.now().difference(startTime) > timeout) {
        throw TimeoutException(
          'Condition did not become true within ${timeout.inSeconds} seconds',
        );
      }
      await Future.delayed(pollInterval);
    }
  }

  /// Finds a widget by its key
  static Finder findByKey(Key key) => find.byKey(key);

  /// Finds a widget by its text
  static Finder findByText(String text) => find.text(text);

  /// Taps a widget using the finder
  static Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pump();
  }

  /// Enters text into a widget using the finder
  static Future<void> enterText(
    WidgetTester tester,
    Finder finder,
    String text,
  ) async {
    await tester.enterText(finder, text);
    await tester.pump();
  }

  /// Scrolls to a widget using the finder
  static Future<void> scrollTo(
    WidgetTester tester,
    Finder finder, {
    Alignment alignment = Alignment.center,
    double? offset,
  }) async {
    await tester.scrollUntilVisible(finder, offset ?? 500.0);
    await tester.pump();
  }
}
