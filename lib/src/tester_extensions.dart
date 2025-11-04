import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Extension methods for WidgetTester
extension WidgetTesterExtensions on WidgetTester {
  /// Taps a widget by its key
  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
    await pump();
  }

  /// Taps a widget by its text
  Future<void> tapByText(String text) async {
    await tap(find.text(text));
    await pump();
  }

  /// Taps a widget by its type
  Future<void> tapByType<T extends Widget>() async {
    await tap(find.byType(T));
    await pump();
  }

  /// Enters text into a widget by its key
  Future<void> enterTextByKey(Key key, String text) async {
    await enterText(find.byKey(key), text);
    await pump();
  }

  /// Enters text into a widget by its type
  Future<void> enterTextByType<T extends Widget>(String text) async {
    await enterText(find.byType(T), text);
    await pump();
  }

  /// Scrolls to a widget by its key
  Future<void> scrollToKey(
    Key key, {
    double offset = 500.0,
    Alignment alignment = Alignment.center,
  }) async {
    await scrollUntilVisible(find.byKey(key), offset);
    await pump();
  }

  /// Scrolls to a widget by its text
  Future<void> scrollToText(
    String text, {
    double offset = 500.0,
    Alignment alignment = Alignment.center,
  }) async {
    await scrollUntilVisible(find.text(text), offset);
    await pump();
  }

  /// Waits for a widget to appear
  Future<void> waitForWidget(
    Finder finder, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final DateTime startTime = DateTime.now();
    while (finder.evaluate().isEmpty) {
      if (DateTime.now().difference(startTime) > timeout) {
        throw TimeoutException(
          'Widget did not appear within ${timeout.inSeconds} seconds',
        );
      }
      await pump(const Duration(milliseconds: 100));
    }
  }

  /// Waits for a widget to disappear
  Future<void> waitForWidgetToDisappear(
    Finder finder, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final DateTime startTime = DateTime.now();
    while (finder.evaluate().isNotEmpty) {
      if (DateTime.now().difference(startTime) > timeout) {
        throw TimeoutException(
          'Widget did not disappear within ${timeout.inSeconds} seconds',
        );
      }
      await pump(const Duration(milliseconds: 100));
    }
  }
}
